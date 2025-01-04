import { DynamoDBClient } from '@aws-sdk/client-dynamodb';
import { DynamoDBDocumentClient, PutCommand } from '@aws-sdk/lib-dynamodb';
import { JobState, VideoAnalysis } from '../../shared/types';

const dynamodb = DynamoDBDocumentClient.from(new DynamoDBClient({}));

export const handler = async (event: JobState): Promise<JobState> => {
    console.log('Result Saver function called with event:', JSON.stringify(event, null, 2));

    const analysis: VideoAnalysis = {
        videoId: event.videoId,
        timestamp: event.timestamp,
        labels: event.labels?.map(label => ({
            label: label.Label?.Name || 'unknown',
            confidence: label.Label?.Confidence || 0,
            timestamp: label.Timestamp || 0,
        })) || [],
        audioPath: event.audioPath || '',
        visualNarrative: event.visualNarrative || '',
        comprehensiveNarrative: event.comprehensiveNarrative || '',
        transcriptionPath: event.transcriptionPath,
        narrationAudioPath: event.narrationAudioPath,
        status: 'COMPLETED'
    };

    await dynamodb.send(new PutCommand({
        TableName: process.env.JOBS_TABLE,
        Item: analysis
    }));

    return {
        ...event,
        status: 'SAVED'
    };
}; 