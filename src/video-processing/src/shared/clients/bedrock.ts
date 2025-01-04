import { BedrockRuntimeClient, InvokeModelCommand } from '@aws-sdk/client-bedrock-runtime';

const bedrock = new BedrockRuntimeClient({
    maxAttempts: 3
});

export const generateNarrative = async (prompt: string): Promise<string> => {
    const response = await bedrock.send(new InvokeModelCommand({
        modelId: 'anthropic.claude-v2',
        contentType: 'application/json',
        accept: 'application/json',
        body: JSON.stringify({
            prompt: `\n\nHuman: ${prompt}\n\nAssistant:`,
            max_tokens_to_sample: 2000,
            temperature: 0.7,
            top_p: 0.9,
        })
    }));

    const responseBody = JSON.parse(new TextDecoder().decode(response.body));
    return responseBody.completion;
}; 