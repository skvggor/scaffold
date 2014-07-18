module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffeelint:
      options:
        "max_line_length":
          value: 80
          level: "warn"
        "no_trailing_semicolons":
          level: "warn"
      app: [
          'scripts/scripts.coffee'
      ]

    coffee:
      compile:
        options:
          bare: true
        files:
          'scripts/scripts.js': 'scripts/scripts.coffee'

    jshint:
      options:
        browser: true
      all: [
          'Gruntfile.js',
          'scripts/scripts.js'
      ]

    min:
      code:
        src: 'scripts/scripts.js'
        dest: 'scripts/scripts.min.js'

    sass:
      options:
        style: 'compressed'
      dist:
        files:
          'styles/styles.min.css': 'styles/styles.sass'

    shell:
      makeDeploy:
        options:
          stderr: false
        command: './deployit.sh'

    notify_hooks:
      options:
        title: "Project Name"

    notify:
      shell:
        options:
          title: 'Success'
          message: 'The files have been sent to server.'

    watch:
      coffeelint:
        files: [
            'scripts/scripts.coffee'
        ]
        tasks: [
            'coffeelint'
        ]

      coffee:
        files: [
            'scripts/scripts.coffee'
        ]
        tasks: [
            'coffee'
        ]

      jshintMin:
        files: [
            'scripts/scripts.js'
        ]
        tasks: [
            'jshint'
            'min'
            'shell'
            'notify:shell'
        ]

      sass:
        files: [
            'styles/styles.sass'
        ]
        tasks: [
            'sass'
            'shell'
            'notify:shell'
        ]

      php:
        files: [
            '*.php'
        ]
        tasks: [
            'shell'
            'notify:shell'
        ]

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-yui-compressor'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-notify'
  grunt.registerTask 'all', ['watch']
  return
