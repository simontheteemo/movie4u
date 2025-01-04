import { JobStatusType } from './constants';

export interface VideoAnalysis {
    videoId: string;
    timestamp: string;
    labels: Array<{
        label: string;
        confidence: number;
        timestamp: number;
    }>;
    audioPath: string;
    visualNarrative: string;
    comprehensiveNarrative: string;
    transcriptionPath?: string;
    narrationAudioPath?: string;
    status: JobStatusType;
}

export type RekognitionJobStatus = 'IN_PROGRESS' | 'SUCCEEDED' | 'FAILED';
export type TranscriptionJobStatus = 'IN_PROGRESS' | 'COMPLETED' | 'FAILED' | 'QUEUED';

export interface JobState {
    videoId: string;
    bucket: string;
    key: string;
    timestamp: string;
    status: JobStatusType;
    error?: string;
    audioPath?: string;
    labelDetectionJobId?: string;
    transcriptionJobName?: string;
    labelDetectionStatus?: RekognitionJobStatus;
    transcriptionStatus?: TranscriptionJobStatus;
    labels?: {
        Label?: {
            Name?: string;
            Confidence?: number;
        };
        Timestamp?: number;
    }[];
    visualNarrative?: string;
    comprehensiveNarrative?: string;
    narrationAudioPath?: string;
    transcriptionPath?: string;
}
