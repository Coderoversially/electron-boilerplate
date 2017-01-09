##
# scripts task:
#   converts all *.coffee files inside folders from src/scripts into one .js file and one .min.js file
#   every *.coffee file which isn't inside a folder will be concat into main.js/main.min.js
#   because of that your app will break if you don't put your *.coffee files into a folder
#

fs = require 'fs'
path = require "path"
merge = require "merge-stream"
gulp = require "gulp"
coffee = require 'gulp-coffee'
concat = require "gulp-concat"
rename = require "gulp-rename"
uglify = require "gulp-uglify"

scriptsPath = "./src/scripts"
destPath = "./app/scripts"

getFolders = (dir) ->
  return fs.readdirSync(dir).filter((file) ->
    return fs.statSync(path.join(dir, file)).isDirectory()
  )

gulp.task 'scripts', ->
  folders = getFolders(scriptsPath)

  tasks = folders.map((folder)->
    return gulp.src(path.join(scriptsPath, folder, '**/*.coffee'))
    .pipe concat(folder + '.coffee')
    .pipe coffee()
    .pipe gulp.dest destPath
    .pipe uglify()
    .pipe rename(folder + '.min.js')
    .pipe gulp.dest destPath
  )

  root = gulp.src(path.join(scriptsPath, '/*.coffee'))
  .pipe concat('main.js')
  .pipe coffee()
  .pipe gulp.dest destPath
  .pipe uglify()
  .pipe rename('main.min.js')
  .pipe gulp.dest destPath

  return merge(tasks, root)