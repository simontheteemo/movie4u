import { PollyClient, StartSpeechSynthesisTaskCommand } from '@aws-sdk/client-polly';
import { ENV } from '../constants';

const polly = new PollyClient({
    maxAttempts: 3
});

export const generateSpeech = async (text: string, videoId: string): Promise<string> => {
    const timestamp = Date.now();
    const response = await polly.send(new StartSpeechSynthesisTaskCommand({
        OutputFormat: 'mp3',
        OutputS3BucketName: ENV.MEDIA_OUTPUT_BUCKET,
        OutputS3KeyPrefix: `narration/${videoId}-${timestamp}`,
        Text: text,
        VoiceId: 'Matthew',
        Engine: 'neural'
    }));

    return `narration/${videoId}-${timestamp}.mp3`;
}; 