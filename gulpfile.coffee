require './tasks/scripts'
require './tasks/stylesheets'
require './tasks/test'

gulp = require 'gulp'

gulp.task 'watch', ->
  gulp.watch('tests/*.spec.coffee', ['test'])
  gulp.watch('src/scripts/**/*.coffee', ['test','scripts'])
  gulp.watch('src/stylesheets/**/*.less', ['stylesheets'])
  return

gulp.task 'default', ->
  return
