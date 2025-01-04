import { JobState } from '../../shared/types';

export const handler = async (event: JobState[]): Promise<JobState> => {
    console.log('Result Combiner function called with event:', JSON.stringify(event, null, 2));
    
    // Extract results from parallel branches
    const [videoAnalysis, audioAnalysis] = event;

    // Validate that both branches completed successfully
    if (!videoAnalysis || !audioAnalysis) {
        throw new Error('Missing results from parallel execution');
    }

    if (videoAnalysis.status !== 'LABELS_DETECTED' || audioAnalysis.status !== 'TRANSCRIPTION_COMPLETED') {
        throw new Error('Invalid state in parallel execution results');
    }

    // Combine the results from both branches
    return {
        ...videoAnalysis,
        ...audioAnalysis,
        status: 'RESULTS_COMBINED'
    };
};