const path = require('path');
const glob = require('glob');

// Get all function entry points
const entries = {};
glob.sync('./src/functions/**/index.ts').forEach((file) => {
  const name = file.split('/')[3]; // Get function name from path
  entries[name] = file;
});

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
};
