import { JobState } from './types';
import { APIGatewayProxyHandler } from 'aws-lambda';

export const validateJobState = (state: JobState): void => {
    if (!state.videoId || !state.bucket || !state.key) {
        throw new Error('Invalid job state: missing required fields');
    }
};

export const getVideoIdFromKey = (key: string): string => {
    return key.split('/').pop()?.split('.')[0] || 'unknown';
};

export const formatError = (error: unknown): string => {
    if (error instanceof Error) {
        return error.message;
    }
    return String(error);
};

export const withApiGatewayErrorHandling = (handler: APIGatewayProxyHandler): APIGatewayProxyHandler => {
    return async (event, context, callback) => {
        try {
            const response = await handler(event, context, callback);
            return response;
        } catch (error) {
            console.error('Error:', error);
            return {
                statusCode: 500,
                body: JSON.stringify({
                    message: formatError(error),
                }),
                headers: {
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*',
                },
            };
        }
    };
};
