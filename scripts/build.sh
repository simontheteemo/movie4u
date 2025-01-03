#!/bin/bash
set -e

# Build all Lambda functions
cd src/video-processing
npm install
npm run build

# Create deployment packages for each function
FUNCTIONS=(
    "initializer"
    "videoAnalyzer"
    "audioProcessor"
    "transcribeProcessor"
    "narrativeGenerator"
    "resultCombiner"
    "failureHandler"
    "stepFunctionTrigger"
)

for func in "${FUNCTIONS[@]}"
do
    echo "Building $func..."
    mkdir -p ../../terraform/modules/processing/lambda/dist/$func
    cp -r dist/functions/$func/* ../../terraform/modules/processing/lambda/dist/$func/
    cd ../../terraform/modules/processing/lambda/dist/$func
    zip -r ../${func}.zip .
    cd ../../../../../src/video-processing
done
