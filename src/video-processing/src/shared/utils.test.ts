import { validateJobState, formatError, getVideoIdFromKey } from './utils';

describe('utils', () => {
    describe('getVideoIdFromKey', () => {
        it('should extract video id from key', () => {
            expect(getVideoIdFromKey('path/to/video123.mp4')).toBe('video123');
        });
    });

    // Add more tests later
}); 