##
# stylesheets task:
#   convert *.less to *.css
#

fs = require 'fs'
path = require 'path'
merge = require 'merge-stream'
gulp = require 'gulp'
less = require 'gulp-less'

stylesheetsPath = "./src/stylesheets"
destPath = "./app/stylesheets"

getFolders = (dir) ->
  return fs.readdirSync(dir).filter((file) ->
    return fs.statSync(path.join(dir, file)).isDirectory()
  )

gulp.task 'stylesheets', ->
  folders = getFolders(stylesheetsPath)

  tasks = folders.map((folder)->
    return gulp.src(path.join(stylesheetsPath, folder, '**/*.less'))
    .pipe less()
    .pipe gulp.dest destPath
  )

  root = gulp.src(path.join(stylesheetsPath, '/*.less'))
  .pipe less()
  .pipe gulp.dest destPath

  return merge(tasks, root)