/*
  The default task (called when you run `gulp` from cli)
*/

var gulp = require('gulp');

gulp.task('default', ['clean', 'serve', 'html', 'vendor', 'stylus', 'watch', 'build']);
