import { JobState } from '../../shared/types';
import { extractAudio } from '../../shared/clients/mediaconvert';
import { startTranscription } from '../../shared/clients/transcribe';

export const handler = async (event: JobState): Promise<JobState> => {
    console.log('Audio Processor function called with event:', JSON.stringify(event, null, 2));
    
    // Extract audio first
    const timestamp = Date.now();
    const audioPath = await extractAudio(event.bucket, event.key, timestamp);
    
    // Start transcription immediately after
    const transcriptionJobName = await startTranscription(audioPath, event.videoId);
    
    return {
        ...event,
        audioPath,
        transcriptionJobName,
        status: 'AUDIO_PROCESSING_STARTED'
    };
};