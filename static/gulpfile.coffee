gulp = require 'gulp'
stylus = require 'gulp-stylus'
coffee = require 'gulp-coffee'
docco = require 'gulp-docco'
connect = require 'gulp-connect'
gutil = require 'gulp-util'
uglify = require 'gulp-uglify'
minifycss = require 'gulp-minify-css'
concat = require 'gulp-concat'
jeet = require 'jeet'

path =
  styl : 'styles/*.styl'
  css : 'styles/styles.css'
  coffee: 'scripts/*.coffee'
  js : 'scripts/scripts.js'
  html : '*.html'

gulp.task 'stylus', ->
  gulp.src path.styl
    .pipe( stylus(use: [jeet()]) )
    .pipe( gulp.dest('styles') )

gulp.task 'coffee', ->
  gulp.src path.coffee
    .pipe( coffee({bare: true} ) )
      .on 'error', gutil.log
    .pipe( gulp.dest('scripts') )

gulp.task 'docco', ->
  gulp.src path.coffee
    .pipe( docco() )
    .pipe( gulp.dest('docs') )

gulp.task 'minify-js', ->
  gulp.src ['scripts/*.js', '!scripts/public.min.js']
    .pipe( concat('public.min.js') )
    .pipe( uglify() )
    .pipe( gulp.dest('scripts') )

gulp.task 'minify-css', ->
  gulp.src ['styles/*.css', '!styles/public.min.css']
    .pipe( concat('public.min.css') )
    .pipe( minifycss() )
    .pipe( gulp.dest('styles') )

gulp.task 'connect', ->
  connect.server
    root: ''
    livereload: true

gulp.task 'html', ->
  gulp.src '*.html'
    .pipe( connect.reload() )

gulp.task 'js', ->
  gulp.src 'scripts/public.min.js'
    .pipe( connect.reload() )

gulp.task 'css', ->
  gulp.src path.css
    .pipe( connect.reload() )

gulp.task 'watch', ->
  gulp.watch path.styl, ['stylus']
  gulp.watch path.coffee, ['coffee', 'docco']
  gulp.watch path.js, ['minify-js']
  gulp.watch path.css, ['minify-css']

  # Live reload
  gulp.watch path.html, ['html']
  gulp.watch path.js, ['js']
  gulp.watch path.css, ['css']

gulp.task 'default', [
    'stylus'
    'coffee'
    'docco'
    'minify-js'
    'minify-css'
    'watch'
    'connect'
]
