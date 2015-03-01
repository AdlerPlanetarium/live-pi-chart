var gulp = require('gulp');
var runSequence = require('run-sequence');

gulp.task('build', [
  'html',
  'browserify',
  'stylus'
]);

gulp.task('build-for-deploy', function(cb) {
  runSequence('build', 'version', cb);
});
