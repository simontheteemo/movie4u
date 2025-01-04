import { S3Client } from '@aws-sdk/client-s3';

export const s3Client = new S3Client({
    maxAttempts: 3,
    // Add region if needed
    // region: process.env.AWS_REGION
});
