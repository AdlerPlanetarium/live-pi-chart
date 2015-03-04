/*
  Move HTML out of client and into build.
*/

var gulp = require('gulp');
var handleErrors = require('../util/handleErrors');

gulp.task('vendor', function() {
  var dest = 'public/build/vendor';

  return gulp.src('public/vendor/**/*.*')
    .on('error', handleErrors)
    .pipe(gulp.dest(dest));
});

