import { JobState } from '../../shared/types';
import { getTranscriptionStatus } from '../../shared/clients/transcribe';

export const handler = async (event: JobState): Promise<JobState> => {
    console.log('Transcription Checker function called with event:', JSON.stringify(event, null, 2));
    
    if (!event.transcriptionJobName) {
        throw new Error('No transcription job name provided');
    }

    const job = await getTranscriptionStatus(event.transcriptionJobName);
    
    if (job?.TranscriptionJobStatus === 'FAILED') {
        throw new Error(`Transcription failed: ${job.FailureReason || 'Unknown error'}`);
    }

    return {
        ...event,
        transcriptionStatus: job?.TranscriptionJobStatus,
        transcriptionPath: job?.Transcript?.TranscriptFileUri,
        status: job?.TranscriptionJobStatus === 'COMPLETED' ? 'TRANSCRIPTION_COMPLETED' : 'TRANSCRIPTION_IN_PROGRESS'
    };
}; 