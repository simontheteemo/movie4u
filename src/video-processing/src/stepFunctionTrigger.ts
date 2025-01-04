import { S3Event } from 'aws-lambda';
import { SFNClient, StartExecutionCommand } from '@aws-sdk/client-sfn';
import { ENV } from './shared/constants';
import { formatError } from './shared/utils';

const sfn = new SFNClient({
    maxAttempts: 3
});

export const handler = async (event: S3Event): Promise<void> => {
    console.log('Step Function Trigger called with event:', JSON.stringify(event, null, 2));

    const record = event.Records[0];
    const input = {
        bucket: record.s3.bucket.name,
        key: decodeURIComponent(record.s3.object.key.replace(/\+/g, ' ')),
        timestamp: new Date().toISOString()
    };

    try {
        await sfn.send(new StartExecutionCommand({
            stateMachineArn: ENV.STATE_MACHINE_ARN,
            input: JSON.stringify(input)
        }));
        console.log('Step Function execution started successfully');
    } catch (error) {
        console.error('Failed to start Step Function execution:', formatError(error));
        throw error;
    }
};
