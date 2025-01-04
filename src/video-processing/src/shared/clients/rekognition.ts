import { RekognitionClient, StartLabelDetectionCommand, GetLabelDetectionCommand } from '@aws-sdk/client-rekognition';

const rekognition = new RekognitionClient({
    maxAttempts: 3
});

export const startLabelDetection = async (bucket: string, key: string) => {
    const response = await rekognition.send(new StartLabelDetectionCommand({
        Video: { S3Object: { Bucket: bucket, Name: key } },
        MinConfidence: 70
    }));
    return response.JobId;
};

export const getLabelDetection = async (jobId: string) => {
    const response = await rekognition.send(new GetLabelDetectionCommand({
        JobId: jobId
    }));
    return response;
};
