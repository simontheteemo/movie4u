# Movie2U

1. S3 (Video) -> Step Functions orchestrating:
2. MediaConvert -> Extract audio
3. Rekognition Video -> Scene detection, object recognition, action detection
4. Transcribe -> Get dialogue
5. Comprehend -> Understand context
6. Bedrock (Claude) -> Generate rich descriptive narrative
7. Polly -> Convert to natural-sounding speech
8. Final Output: Audio description + original audio


Example flow for a movie scene:

Rekognition detects: "Person walking into a dimly lit room"
Transcribe captures dialogue: "Hello? Is anyone there?"
Claude combines this into: "In a tense moment, Sarah cautiously enters a shadowy living room, her voice trembling as she calls out 'Hello? Is anyone there?'"
Polly converts this to natural speech

Key AWS Services needed:

S3 for video storage
MediaConvert for video/audio processing
Rekognition Video for scene analysis
Transcribe for dialogue
Comprehend for context analysis
Bedrock (Claude) for narrative generation
Polly for text-to-speech
Step Functions to orchestrate the workflow
DynamoDB to store metadata
