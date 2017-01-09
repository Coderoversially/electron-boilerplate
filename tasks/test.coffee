path = require 'path'
gulp = require 'gulp'
gutil = require 'gulp-util'
mocha = require 'gulp-mocha'

testPath = "./tests"

gulp.task 'test', ->
  return gulp.src(path.join(testPath, '*.spec.coffee'))
  .pipe mocha({reporter: 'list'})
  .on 'error', gutil.log