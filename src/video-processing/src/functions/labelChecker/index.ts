import { JobState } from '../../shared/types';
import { getLabelDetection } from '../../shared/clients/rekognition';

export const handler = async (event: JobState): Promise<JobState> => {
    console.log('Label Checker function called with event:', JSON.stringify(event, null, 2));
    
    if (!event.labelDetectionJobId) {
        throw new Error('No label detection job ID provided');
    }

    const response = await getLabelDetection(event.labelDetectionJobId);
    
    return {
        ...event,
        labelDetectionStatus: response.JobStatus,
        labels: response.Labels,
        status: response.JobStatus === 'SUCCEEDED' ? 'LABELS_DETECTED' : 'LABEL_DETECTION_IN_PROGRESS'
    };
}; 