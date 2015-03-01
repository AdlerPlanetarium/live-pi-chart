var fs = require('fs');

var gulp = require('gulp');
var rev = require('gulp-rev');

gulp.task('version-assets', function() {
  try {
    var oldAssets = fs.readdirSync('public/build/assets');
    var filePath = null;

    for (var i = 0; i < oldAssets.length; i++) {
      filePath = 'public/build/assets/' + oldAssets[i];
      if (fs.statSync(filePath).isFile()) {
        fs.unlinkSync(filePath);
      }
    }
  } catch(e) {
    console.log('Unable to remove old assets. Maybe there are none?');
  }

  return gulp.src([
      'public/build/*.js',
      'public/build/*.css'
    ])
    .pipe(rev())
    .pipe(gulp.dest('public/build/assets'))
    .pipe(rev.manifest())
    .pipe(gulp.dest(''));
});

gulp.task('version', ['version-assets'], function() {
  var manifest = JSON.parse(fs.readFileSync('./rev-manifest.json'));
  var index = fs.readFileSync('public/build/index.html', { encoding: 'utf-8' });

  for (asset in manifest) {
    index = index.replace(asset, 'assets/' + manifest[asset]);
  }

  fs.writeFileSync('public/build/index.html', index);
});
