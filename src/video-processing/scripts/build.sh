#!/bin/bash

# Clean previous builds
rm -rf dist

# Run webpack build
npm run build

# Create dist directory for terraform
mkdir -p ../terraform/modules/processing/lambda/dist

# Zip each function
cd dist/functions
for func in *; do
    if [ -d "$func" ]; then
        zip -r "../../../terraform/modules/processing/lambda/dist/${func}.zip" "$func"/*
    fi
done 