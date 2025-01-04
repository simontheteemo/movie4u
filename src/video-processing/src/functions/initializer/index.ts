import { S3Event } from 'aws-lambda';
import { JobState } from '../../shared/types';

export const handler = async (event: S3Event): Promise<JobState> => {
    console.log('Initializer function called with event:', JSON.stringify(event, null, 2));
    
    const record = event.Records[0];
    const bucket = record.s3.bucket.name;
    const key = decodeURIComponent(record.s3.object.key.replace(/\+/g, ' '));
    const videoId = key.split('/').pop()?.split('.')[0] || 'unknown';
    
    return {
        videoId,
        bucket,
        key,
        timestamp: new Date().toISOString(),
        status: 'INITIALIZED'
    };
};