require './tasks/scripts'
require './tasks/stylesheets'
require './tasks/test'

gulp = require 'gulp'

# todo each unit should be tested before concat and convert
gulp.task 'watch', ->
  gulp.watch('tests/*.spec.coffee', ['test'])
  gulp.watch('src/scripts/**/*.coffee', ['test','scripts'])
  gulp.watch('src/stylesheets/**/*.less', ['stylesheets'])
  return

gulp.task 'default', ->
  return
