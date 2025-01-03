export const handler = async (event: any) => {
    console.log('Video Analyzer function called with event:', JSON.stringify(event, null, 2));
    return {
        ...event,
        status: 'VIDEO_ANALYZED'
    };
};