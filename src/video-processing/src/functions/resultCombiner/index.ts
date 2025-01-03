export const handler = async (event: any) => {
    console.log('Result Combiner function called with event:', JSON.stringify(event, null, 2));
    return {
        ...event,
        status: 'COMPLETED'
    };
};
