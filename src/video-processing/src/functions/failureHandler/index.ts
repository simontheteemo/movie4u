import { DynamoDBClient } from '@aws-sdk/client-dynamodb';
import { DynamoDBDocumentClient, PutCommand } from '@aws-sdk/lib-dynamodb';
import { JobState } from '../../shared/types';
import { formatError } from '../../shared/utils';
import { ENV } from '../../shared/constants';

const dynamodb = DynamoDBDocumentClient.from(new DynamoDBClient({
    maxAttempts: 3
}));

export const handler = async (event: JobState & { error?: Error }): Promise<void> => {
    console.log('Failure Handler called with event:', JSON.stringify(event, null, 2));

    try {
        await dynamodb.send(new PutCommand({
            TableName: ENV.JOBS_TABLE,
            Item: {
                videoId: event.videoId,
                timestamp: event.timestamp,
                status: 'FAILED',
                error: formatError(event.error || 'Unknown error')
            }
        }));
    } catch (error) {
        console.error('Error in failureHandler:', formatError(error));
        // Since this is the failure handler, we log but don't throw
    }
};
