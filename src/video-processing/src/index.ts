import { S3Event } from 'aws-lambda';
import { RekognitionClient, StartLabelDetectionCommand, GetLabelDetectionCommand } from '@aws-sdk/client-rekognition';
import { DynamoDBClient } from '@aws-sdk/client-dynamodb';
import { DynamoDBDocumentClient, PutCommand } from '@aws-sdk/lib-dynamodb';
import { BedrockRuntimeClient, InvokeModelCommand } from '@aws-sdk/client-bedrock-runtime';
import { MediaConvertClient, CreateJobCommand } from '@aws-sdk/client-mediaconvert';
import { TranscribeClient, StartTranscriptionJobCommand } from '@aws-sdk/client-transcribe';
import { S3Client, GetObjectCommand } from '@aws-sdk/client-s3';

const s3Client = new S3Client({});
const rekognition = new RekognitionClient({});
const dynamodb = DynamoDBDocumentClient.from(new DynamoDBClient({}));
const bedrock = new BedrockRuntimeClient({ region: process.env.AWS_REGION });
const mediaconvert = new MediaConvertClient({
    endpoint: process.env.MEDIACONVERT_ENDPOINT
});
const transcribe = new TranscribeClient({ region: process.env.AWS_REGION });

interface VideoAnalysis {
    videoId: string;
    timestamp: string;
    labels: Array<{
        label: string;
        confidence: number;
        timestamp: number;
    }>;
    audioPath: string;
    visualNarrative: string;
    comprehensiveNarrative: string;
    transcriptionPath?: string;
    status: string;
}

async function getTranscription(transcriptionPath: string): Promise<string> {
    try {
        
        console.log('Getting transcription from:', transcriptionPath);
        await new Promise(resolve => setTimeout(resolve, 15000));
        console.log('waiting 15 seconds for transcription to be ready');
        const response = await s3Client.send(new GetObjectCommand({
            Bucket: process.env.MEDIA_OUTPUT_BUCKET!,
            Key: transcriptionPath
        }));

        const transcriptionData = await response.Body?.transformToString();
        if (!transcriptionData) {
            throw new Error('No transcription data found');
        }

        const parsedData = JSON.parse(transcriptionData);
        return parsedData.results.transcripts[0].transcript;
    } catch (error) {
        console.error('Error reading transcription:', error);
        throw error;
    }
}

async function generateComprehensiveNarrative(labels: any[], transcript: string): Promise<string> {
    const scenes = labels.reduce((acc: any, label: any) => {
        const timestamp = Math.floor((label.Timestamp || 0) / 1000);
        if (!acc[timestamp]) {
            acc[timestamp] = [];
        }
        if (label.Label?.Name) {
            acc[timestamp].push(label.Label.Name);
        }
        return acc;
    }, {});

    const body = {
        anthropic_version: "bedrock-2023-05-31",
        max_tokens: 1000,
        top_k: 250,
        stop_sequences: [],
        temperature: 0.7,
        top_p: 0.999,
        messages: [
            {
                role: "user",
                content: [
                    {
                        type: "text",
                        text: `You are an assistant helping blind people understand videos. Create a comprehensive narrative combining visual elements and spoken dialogue.

Visual elements by timestamp:
${Object.entries(scenes)
                                .map(([time, labels]) => `At ${time} seconds: ${(labels as string[]).join(', ')}`)
                                .join('\n')}

Spoken dialogue: "${transcript}"

Create a flowing narrative that:
1. Describes the visual scenes and actions
2. Integrates the spoken dialogue naturally
3. Maintains temporal alignment between visual elements and speech
4. Provides context that helps visualize the complete scene`
                    }
                ]
            }
        ]
    };

    try {
        const response = await bedrock.send(new InvokeModelCommand({
            modelId: "anthropic.claude-3-5-sonnet-20241022-v2:0",
            body: JSON.stringify(body),
            contentType: 'application/json',
            accept: 'application/json',
        }));

        const responseData = JSON.parse(new TextDecoder().decode(response.body));
        const narrative = responseData.messages?.[0]?.content?.[0]?.text
            || responseData.content?.[0]?.text
            || 'No narrative generated';

        console.log('Generated comprehensive narrative:', narrative);
        return narrative;
    } catch (error) {
        console.error('Error generating comprehensive narrative:', error);
        return 'Error generating comprehensive narrative';
    }
}

async function startTranscription(audioPath: string, videoId: string, timestamp: number): Promise<string> {
    const jobName = `transcribe-${videoId}-${timestamp}`;
    console.log(`start transcribe job ${jobName} in 2 seconds`);  //over racing with audio extraction
    await new Promise(resolve => setTimeout(resolve, 2000));  // TOFIX: wait for audio extraction to complete

    // Debug logging
    console.log('S3 URI:', `s3://${process.env.MEDIA_OUTPUT_BUCKET}/${audioPath}`);

    const params = {
        TranscriptionJobName: jobName,
        LanguageCode: 'en-US' as const,
        MediaFormat: 'mp4' as const,
        Media: {
            MediaFileUri: `s3://${process.env.MEDIA_OUTPUT_BUCKET}/${audioPath}`
        },
        OutputBucketName: process.env.MEDIA_OUTPUT_BUCKET,
        OutputKey: `transcripts/${videoId}-${timestamp}.json`
    };

    console.log('Transcribe params:', JSON.stringify(params, null, 2));

    try {
        await transcribe.send(new StartTranscriptionJobCommand(params));
        console.log('Transcription job started:', jobName);
        return `transcripts/${videoId}-${timestamp}.json`;
    } catch (error) {
        console.error('Error starting transcription job:', error);
        console.error('Full params:', JSON.stringify(params, null, 2));
        throw error;
    }
}

async function extractAudio(bucket: string, key: string, timestamp: number): Promise<string> {
    const jobParams = {
        Queue: process.env.MEDIACONVERT_QUEUE,
        Role: process.env.MEDIACONVERT_ROLE,
        Settings: {
            Inputs: [{
                FileInput: `s3://${bucket}/${key}`,
                AudioSelectors: {
                    "Audio Selector 1": {
                        DefaultSelection: "DEFAULT" as const
                    }
                }
            }],
            OutputGroups: [{
                Name: "Audio",
                OutputGroupSettings: {
                    Type: "FILE_GROUP_SETTINGS" as const,
                    FileGroupSettings: {
                        Destination: `s3://${process.env.MEDIA_OUTPUT_BUCKET}/audio/`
                    }
                },
                Outputs: [{
                    AudioDescriptions: [{
                        CodecSettings: {
                            Codec: "AAC" as const,
                            AacSettings: {
                                Bitrate: 96000,
                                CodingMode: "CODING_MODE_2_0" as const,
                                SampleRate: 48000
                            }
                        }
                    }],
                    ContainerSettings: {
                        Container: "MP4" as const,
                        Mp4Settings: {}
                    },
                    NameModifier: `-${timestamp}`
                }]
            }]
        }
    };

    try {
        const response = await mediaconvert.send(new CreateJobCommand(jobParams));
        console.log('MediaConvert job created:', response.Job?.Id);
        return `audio/${key.split('/').pop()?.replace(/\.[^/.]+$/, '')}-${timestamp}.mp4`;
    } catch (error) {
        console.error('Error creating MediaConvert job:', error);
        throw error;
    }
}

async function generateNarrative(labels: any[]): Promise<string> {
    // Group labels by timestamp for scene-by-scene description
    const scenes = labels.reduce((acc: any, label: any) => {
        const timestamp = Math.floor((label.Timestamp || 0) / 1000);
        if (!acc[timestamp]) {
            acc[timestamp] = [];
        }
        if (label.Label?.Name) {
            acc[timestamp].push(label.Label.Name);
        }
        return acc;
    }, {});

    // Create scene description
    const sceneDescription = Object.entries(scenes)
        .map(([time, labels]) =>
            `At ${time} seconds: ${(labels as string[]).join(', ')}`
        ).join('\n');

    const body = {
        anthropic_version: "bedrock-2023-05-31",
        max_tokens: 1000,
        top_k: 250,
        stop_sequences: [],
        temperature: 0.7,
        top_p: 0.999,
        messages: [
            {
                role: "user",
                content: [
                    {
                        type: "text",
                        text: `You are an assistant helping blind people understand videos. Create a natural, descriptive narrative from these scene labels:\n\n${sceneDescription}\n\nProvide a flowing, natural description that helps visualize the scene progression. Focus on key actions and changes.`
                    }
                ]
            }
        ]
    };

    try {
        const response = await bedrock.send(new InvokeModelCommand({
            modelId: "anthropic.claude-3-5-sonnet-20241022-v2:0",
            body: JSON.stringify(body),
            contentType: 'application/json',
            accept: 'application/json',
        }));

        const responseData = JSON.parse(new TextDecoder().decode(response.body));
        const narrative = responseData.messages?.[0]?.content?.[0]?.text
            || responseData.content?.[0]?.text
            || 'No narrative generated';

        console.log('Generated narrative:', narrative);
        return narrative;
    } catch (error) {
        console.error('Error generating narrative:', error);
        return 'Error generating narrative description';
    }
}

export const handler = async (event: S3Event): Promise<void> => {
    try {
        console.log('Processing video analysis event:', JSON.stringify(event, null, 2));
        

        for (const record of event.Records) {
            const bucket = record.s3.bucket.name;
            const key = decodeURIComponent(record.s3.object.key.replace(/\+/g, ' '));
            const videoId = key.split('/').pop()?.split('.')[0] || 'unknown';
            const timestamp = Date.now();
            
            console.log(`Processing video with timestamp: ${timestamp} from bucket: ${bucket}, key: ${key}`);

            // extract audio and start label detection
            const [audioPath, labelDetectionJob] = await Promise.all([
                extractAudio(bucket, key, timestamp),
                rekognition.send(new StartLabelDetectionCommand({
                    Video: { S3Object: { Bucket: bucket, Name: key } },
                    MinConfidence: 70
                }))
            ]);

            if (!labelDetectionJob.JobId) {
                throw new Error('Failed to start label detection job');
            }

            // Start transcription after audio extraction
            const transcriptionPath = await startTranscription(audioPath, videoId, timestamp);

            // Wait for transcription job to complete (you might want to add a wait function here)
            const transcript = await getTranscription(transcriptionPath);
            
            // Get analysis results
            const labels = await waitForLabelDetection(labelDetectionJob.JobId);

            // Generate narrative using Bedrock
            const [visualNarrative, comprehensiveNarrative] = await Promise.all([
                generateNarrative(labels),
                generateComprehensiveNarrative(labels, transcript)
            ]);
            // Save results to DynamoDB
            const analysis: VideoAnalysis = {
                videoId,
                timestamp: new Date().toISOString(),
                labels: labels.map(label => ({
                    label: label.Label?.Name || 'unknown',
                    confidence: label.Label?.Confidence || 0,
                    timestamp: label.Timestamp || 0,
                })),
                audioPath,
                status: 'COMPLETED',
                visualNarrative,
                comprehensiveNarrative,
                transcriptionPath,
            };

            await dynamodb.send(
                new PutCommand({
                    TableName: process.env.ANALYSIS_TABLE,
                    Item: analysis,
                })
            );

            console.log('Analysis saved successfully:', videoId);
        }
    } catch (error) {
        console.error('Error processing video:', error);
        throw error;
    }
};

async function waitForLabelDetection(jobId: string, maxAttempts = 60): Promise<any[]> {
    let attempts = 0;
    while (attempts < maxAttempts) {
        const result = await rekognition.send(
            new GetLabelDetectionCommand({
                JobId: jobId,
            })
        );

        if (result.JobStatus === 'SUCCEEDED') {
            return result.Labels || [];
        }

        if (result.JobStatus === 'FAILED') {
            throw new Error(`Label detection failed: ${result.StatusMessage}`);
        }

        attempts++;
        await new Promise(resolve => setTimeout(resolve, 1000));
    }

    throw new Error('Label detection timed out');
}