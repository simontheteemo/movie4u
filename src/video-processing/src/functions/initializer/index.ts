export const handler = async (event: any) => {
    console.log('Initializer function called with event:', JSON.stringify(event, null, 2));
    return {
        jobId: 'test-job-' + Date.now(),
        status: 'INITIALIZED'
    };
};