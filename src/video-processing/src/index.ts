import { S3Event } from 'aws-lambda';
import { RekognitionClient, StartLabelDetectionCommand, GetLabelDetectionCommand } from '@aws-sdk/client-rekognition';
import { DynamoDBClient } from '@aws-sdk/client-dynamodb';
import { DynamoDBDocumentClient, PutCommand } from '@aws-sdk/lib-dynamodb';

const rekognition = new RekognitionClient({});
const dynamodb = DynamoDBDocumentClient.from(new DynamoDBClient({}));

interface VideoAnalysis {
  videoId: string;
  timestamp: string;
  labels: Array<{
    label: string;
    confidence: number;
    timestamp: number;
  }>;
  status: string;
}

export const handler = async (event: S3Event): Promise<void> => {
  try {
    console.log('Processing video analysis event:', JSON.stringify(event, null, 2));

    for (const record of event.Records) {
      const bucket = record.s3.bucket.name;
      const key = decodeURIComponent(record.s3.object.key.replace(/\+/g, ' '));
      const videoId = key.split('/').pop()?.split('.')[0] || 'unknown';

      console.log(`Processing video from bucket: ${bucket}, key: ${key}`);

      // Start video analysis
      const startLabelDetection = await rekognition.send(
        new StartLabelDetectionCommand({
          Video: {
            S3Object: {
              Bucket: bucket,
              Name: key,
            },
          },
          MinConfidence: 70,
        })
      );

      if (!startLabelDetection.JobId) {
        throw new Error('Failed to start label detection job');
      }

      // Get analysis results
      const labels = await waitForLabelDetection(startLabelDetection.JobId);

      // Save results to DynamoDB
      const analysis: VideoAnalysis = {
        videoId,
        timestamp: new Date().toISOString(),
        labels: labels.map(label => ({
          label: label.Label?.Name || 'unknown',
          confidence: label.Label?.Confidence || 0,
          timestamp: label.Timestamp || 0,
        })),
        status: 'COMPLETED',
      };

      await dynamodb.send(
        new PutCommand({
          TableName: process.env.ANALYSIS_TABLE,
          Item: analysis,
        })
      );

      console.log('Analysis saved successfully:', videoId);
    }
  } catch (error) {
    console.error('Error processing video:', error);
    throw error;
  }
};

async function waitForLabelDetection(jobId: string, maxAttempts = 60): Promise<any[]> {
  let attempts = 0;
  while (attempts < maxAttempts) {
    const result = await rekognition.send(
      new GetLabelDetectionCommand({
        JobId: jobId,
      })
    );

    if (result.JobStatus === 'SUCCEEDED') {
      return result.Labels || [];
    }

    if (result.JobStatus === 'FAILED') {
      throw new Error(`Label detection failed: ${result.StatusMessage}`);
    }

    attempts++;
    await new Promise(resolve => setTimeout(resolve, 1000));
  }

  throw new Error('Label detection timed out');
}