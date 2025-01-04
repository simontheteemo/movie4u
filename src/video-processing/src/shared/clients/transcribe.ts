import { TranscribeClient, StartTranscriptionJobCommand, GetTranscriptionJobCommand } from '@aws-sdk/client-transcribe';
import { ENV } from '../constants';

const transcribe = new TranscribeClient({
    maxAttempts: 3
});

export const startTranscription = async (audioPath: string, videoId: string): Promise<string> => {
    const jobName = `${videoId}-${Date.now()}`;
    await transcribe.send(new StartTranscriptionJobCommand({
        TranscriptionJobName: jobName,
        Media: { MediaFileUri: audioPath },
        MediaFormat: 'mp4',
        LanguageCode: 'en-US',
        OutputBucketName: ENV.MEDIA_OUTPUT_BUCKET,
        OutputKey: `transcripts/${jobName}.json`
    }));
    return jobName;
};

export const getTranscriptionStatus = async (jobName: string) => {
    const response = await transcribe.send(new GetTranscriptionJobCommand({
        TranscriptionJobName: jobName
    }));
    return response.TranscriptionJob;
}; 