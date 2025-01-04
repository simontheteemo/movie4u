import { JobState } from '../../shared/types';

export const handler = async (event: JobState[]): Promise<JobState> => {
    console.log('Result Combiner function called with event:', JSON.stringify(event, null, 2));
    
    // Extract results from parallel branches
    const [videoAnalysis, audioAnalysis] = event;

    // Combine the results from both branches
    return {
        ...videoAnalysis,
        ...audioAnalysis,
        status: 'RESULTS_COMBINED'
    };
};