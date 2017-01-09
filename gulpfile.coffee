require './tasks/scripts'
require './tasks/stylesheets'

gulp = require 'gulp'

# todo each unit should be tested before concat and convert
gulp.task 'watch', ->
  gulp.watch('src/scripts/**/*.coffee', ['scripts'])
  gulp.watch('src/stylesheets/**/*.less', ['stylesheets'])
  return

gulp.task 'default', ->
  return
