export const handler = async (event: any) => {
    console.log('Audio Processor function called with event:', JSON.stringify(event, null, 2));
    return {
        ...event,
        status: 'AUDIO_PROCESSED'
    };
};
