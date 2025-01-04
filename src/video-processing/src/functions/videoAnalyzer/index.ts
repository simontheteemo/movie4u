import { JobState } from '../../shared/types';
import { startLabelDetection } from '../../shared/clients/rekognition';

export const handler = async (event: JobState): Promise<JobState> => {
    console.log('Video Analyzer function called with event:', JSON.stringify(event, null, 2));
    
    const labelDetectionJobId = await startLabelDetection(event.bucket, event.key);
    
    return {
        ...event,
        labelDetectionJobId,
        status: 'LABEL_DETECTION_STARTED'
    };
};