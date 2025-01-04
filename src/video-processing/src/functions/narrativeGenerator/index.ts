import { JobState } from '../../shared/types';
import { generateNarrative } from '../../shared/clients/bedrock';
import { generateSpeech } from '../../shared/clients/polly';
import { GetObjectCommand, S3Client } from '@aws-sdk/client-s3';

const s3Client = new S3Client({});

export const handler = async (event: JobState): Promise<JobState> => {
    console.log('Narrative Generator function called with event:', JSON.stringify(event, null, 2));
    
    if (!event.labels || !event.transcriptionPath) {
        throw new Error('Missing required data: labels or transcription');
    }

    // Generate visual narrative from labels
    const labelPrompt = `Generate a concise visual description from these video labels: ${JSON.stringify(event.labels)}`;
    const visualNarrative = await generateNarrative(labelPrompt);

    // Get transcription content
    const transcriptUrl = new URL(event.transcriptionPath);
    const transcriptResponse = await s3Client.send(new GetObjectCommand({
        Bucket: transcriptUrl.hostname,
        Key: transcriptUrl.pathname.slice(1)
    }));
    
    const transcriptBody = await transcriptResponse.Body?.transformToString();
    const transcript = JSON.parse(transcriptBody || '{}').results?.transcripts?.[0]?.transcript || '';

    // Generate comprehensive narrative
    const comprehensivePrompt = `Create a comprehensive description combining visual elements and audio transcript. 
        Visual elements: ${visualNarrative}
        Audio transcript: ${transcript}`;
    const comprehensiveNarrative = await generateNarrative(comprehensivePrompt);

    // Generate audio narration
    const narrationAudioPath = await generateSpeech(
        comprehensiveNarrative,
        event.videoId
    );

    return {
        ...event,
        visualNarrative,
        comprehensiveNarrative,
        narrationAudioPath,
        status: 'NARRATIVE_GENERATED'
    };
};
