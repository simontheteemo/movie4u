---
layout: default
title: Technical Stack
description: movie4u Technical Stack
---

[Home](./README.md) | 
[Architecture](./architecture.md) | 
[Technical Stack](./technical-stack.md) | 
[Deployment](./deployment.md) | 
[Demo](./demo.md)

# Technical Stack

## AWS Services
- **S3**: Video and audio storage
- **Lambda**: Serverless computing
- **DynamoDB**: Data storage
- **Rekognition**: Video analysis
- **MediaConvert**: Audio extraction
- **Transcribe**: Speech-to-text
- **Bedrock (Claude)**: Narrative generation
- **Polly**: Text-to-speech

## Development
- **Language**: TypeScript
- **Runtime**: Node.js 18.x
- **Infrastructure**: Terraform
- **CI/CD**: GitHub Actions

## AWS SDK Libraries
```typescript
import { S3Event } from 'aws-lambda';
import { RekognitionClient } from '@aws-sdk/client-rekognition';
import { DynamoDBClient } from '@aws-sdk/client-dynamodb';
import { BedrockRuntimeClient } from '@aws-sdk/client-bedrock-runtime';
import { MediaConvertClient } from '@aws-sdk/client-mediaconvert';
import { TranscribeClient } from '@aws-sdk/client-transcribe';
import { PollyClient } from '@aws-sdk/client-polly';
```

## Infrastructure as Code
- Terraform modules
- S3 backend for state
- GitHub Actions for deployment

## Development Tools
- VS Code
- AWS CLI
- Terraform CLI
- Node.js and npm