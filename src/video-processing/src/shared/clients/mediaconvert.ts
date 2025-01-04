import { MediaConvertClient, CreateJobCommand } from '@aws-sdk/client-mediaconvert';
import { ENV } from '../constants';

const mediaconvert = new MediaConvertClient({
    endpoint: ENV.MEDIACONVERT_ENDPOINT,
    maxAttempts: 3
});

export const extractAudio = async (bucket: string, key: string, timestamp: number): Promise<string> => {
    const jobParams = {
        Queue: ENV.MEDIACONVERT_QUEUE,
        Role: ENV.MEDIACONVERT_ROLE,
        Settings: {
            Inputs: [{
                FileInput: `s3://${bucket}/${key}`,
                AudioSelectors: {
                    "Audio Selector 1": {
                        DefaultSelection: "DEFAULT" as const
                    }
                }
            }],
            OutputGroups: [{
                Name: "Audio",
                OutputGroupSettings: {
                    Type: "FILE_GROUP_SETTINGS" as const,
                    FileGroupSettings: {
                        Destination: `s3://${ENV.MEDIA_OUTPUT_BUCKET}/audio/`
                    }
                },
                Outputs: [{
                    AudioDescriptions: [{
                        CodecSettings: {
                            Codec: "AAC" as const,
                            AacSettings: {
                                Bitrate: 96000,
                                CodingMode: "CODING_MODE_2_0" as const,
                                SampleRate: 48000
                            }
                        }
                    }],
                    ContainerSettings: {
                        Container: "MP4" as const,
                        Mp4Settings: {}
                    },
                    NameModifier: `-${timestamp}`
                }]
            }]
        }
    };

    const response = await mediaconvert.send(new CreateJobCommand(jobParams));
    return `audio/${key.split('/').pop()?.replace(/\.[^/.]+$/, '')}-${timestamp}.mp4`;
};
