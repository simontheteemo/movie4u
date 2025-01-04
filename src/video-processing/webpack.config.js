const path = require('path');
const glob = require('glob');

// Get all function entry points
const entries = {};

// Add all function handlers
glob.sync('./src/functions/**/index.ts').forEach((file) => {
  const name = file.split('/')[3]; // Get function name from path
  entries[name] = './' + file;  // Add ./ to make it relative
});

// Add step function trigger separately
entries.stepFunctionTrigger = './src/stepFunctionTrigger.ts';

module.exports = {
  entry: entries,
  target: 'node',
  mode: 'production',
  module: {
    rules: [
      {
        test: /\.ts$/,
        use: 'ts-loader',
        exclude: /node_modules/,
      },
    ],
  },
  resolve: {
    extensions: ['.ts', '.js'],
    alias: {
      '@shared': path.resolve(__dirname, 'src/shared/'),
    },
  },
  output: {
    filename: '[name]/index.js',
    path: path.resolve(__dirname, 'dist/functions'),
    libraryTarget: 'commonjs2',
  },
  optimization: {
    minimize: false  // Disable minimization for better debugging
  },
  externals: {
    '@aws-sdk/client-s3': '@aws-sdk/client-s3',
    '@aws-sdk/client-dynamodb': '@aws-sdk/client-dynamodb',
    '@aws-sdk/client-bedrock-runtime': '@aws-sdk/client-bedrock-runtime',
    '@aws-sdk/client-mediaconvert': '@aws-sdk/client-mediaconvert',
    '@aws-sdk/client-polly': '@aws-sdk/client-polly',
    '@aws-sdk/client-rekognition': '@aws-sdk/client-rekognition',
    '@aws-sdk/client-transcribe': '@aws-sdk/client-transcribe',
    '@aws-sdk/client-sfn': '@aws-sdk/client-sfn',
    '@aws-sdk/lib-dynamodb': '@aws-sdk/lib-dynamodb',
    '@aws-sdk/util-dynamodb': '@aws-sdk/util-dynamodb'
  }
};
