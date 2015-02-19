gulp = require 'gulp'
rename = require 'gulp-rename'
stylus = require 'gulp-stylus'
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
docco = require 'gulp-docco'
connect = require 'gulp-connect'
gutil = require 'gulp-util'
uglify = require 'gulp-uglify'
minifycss = require 'gulp-minify-css'
minifyhtml = require 'gulp-htmlclean'
imagemin = require 'gulp-imagemin'
pngquant = require 'imagemin-pngquant'
concat = require 'gulp-concat'
jeet = require 'jeet'
axis = require 'axis'
rupture = require 'rupture'

path =
  styl : './styles/*.styl'
  css : './styles/styles.css'
  coffee: './scripts/*.coffee'
  js : './scripts/scripts.js'
  html : './*dev.html'
  php : './*dev.php'
  image : './images/*'

gulp.task 'stylus', ->
  gulp.src path.styl
    .pipe( stylus(use: [jeet(), axis(), rupture()]) )
    .pipe( gulp.dest('styles') )

gulp.task 'coffee', ->
  gulp.src path.coffee
    .pipe( coffee({bare: true} ) )
      .on 'error', gutil.log
    .pipe( gulp.dest('scripts') )

gulp.task 'coffeelint', ->
  gulp.src path.coffee
    .pipe( coffeelint() )
    .pipe( coffeelint.reporter() )

gulp.task 'docco', ->
  gulp.src path.coffee
    .pipe( docco() )
    .pipe( gulp.dest('docs') )

gulp.task 'minify-js', ->
  gulp.src ['scripts/*.js', '!./scripts/public.min.js']
    .pipe( concat('public.min.js') )
    .pipe( uglify() )
    .pipe( gulp.dest('scripts') )

gulp.task 'minify-css', ->
  gulp.src ['styles/*.css', '!./styles/public.min.css']
    .pipe( concat('public.min.css') )
    .pipe( minifycss() )
    .pipe( gulp.dest('styles') )

gulp.task 'minify-html-php', ->
  gulp.src [path.html, path.php]
    .pipe( rename((path) ->
      path.basename = path.basename.replace '-dev', ''
      return
    ) )
    .pipe( minifyhtml() )
    .pipe( gulp.dest('./') )

gulp.task 'minify-image', ->
  gulp.src [path.image, '!./images/public']
    .pipe( imagemin({
      progressive: true
      svgoPlugins: [{removeViewBox: false}]
      use: [pngquant()]
    }) )
    .pipe( gulp.dest('./images/public') )

gulp.task 'connect', ->
  connect.server
    root: ''
    livereload: true

gulp.task 'html', ->
  gulp.src '*.html'
    .pipe( connect.reload() )

gulp.task 'php', ->
  gulp.src '*.php'
    .pipe( connect.reload() )

gulp.task 'js', ->
  gulp.src 'scripts/public.min.js'
    .pipe( connect.reload() )

gulp.task 'css', ->
  gulp.src path.css
    .pipe( connect.reload() )

gulp.task 'watch', ->
  gulp.watch path.styl, ['stylus']
  gulp.watch path.coffee, ['coffee', 'coffeelint', 'docco']
  gulp.watch path.js, ['minify-js']
  gulp.watch path.css, ['minify-css']
  gulp.watch [path.html, path.php], ['minify-html-php', 'minify-image']

  # Live reload
  gulp.watch path.html, ['html']
  gulp.watch path.php, ['php']
  gulp.watch path.js, ['js']
  gulp.watch path.css, ['css']

gulp.task 'default', [
    'stylus'
    'coffee'
    'coffeelint'
    'docco'
    'minify-js'
    'minify-css'
    'minify-html-php'
    'minify-image'
    'watch'
    'connect'
]
