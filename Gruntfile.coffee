module.exports = (grunt) ->

  require 'coffee-script'
  require 'coffee-errors'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-simple-mocha'
  grunt.loadNpmTasks 'grunt-notify'

  grunt.registerTask 'default', ['test', 'watch']
  grunt.registerTask 'build', ['coffee', 'uglify', 'stylus', 'cssmin', 'jade']
  grunt.registerTask 'test', ['coffeelint', 'build', 'simplemocha']

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    coffeelint:
      options:
        max_line_length:
          value: 79
        indentation:
          value: 2
        newlines_after_classes:
          level: 'error'
        no_empty_param_list:
          level: 'error'
        no_unnecessary_fat_arrows:
          level: 'ignore'
      dist:
        files: [
          { expand: yes, cwd: 'assets/', src: [ '**/*.coffee' ] }
          { expand: yes, cwd: 'config/', src: [ '**/*.coffee' ] }
          { expand: yes, cwd: 'events/', src: [ '**/*.coffee' ] }
          { expand: yes, cwd: 'helper/', src: [ '**/*.coffee' ] }
          { expand: yes, cwd: 'models/', src: [ '**/*.coffee' ] }
          { expand: yes, cwd: 'tests/', src: [ '**/*.coffee' ] }
        ]

    coffee:
      compile:
        files: [{
          expand: yes
          cwd: 'assets/'
          src: [ '*.coffee', '**/*.coffee' ]
          dest: 'dist/'
          ext: '.js'
        }]

    stylus:
      compile:
        files: [{
          expand: yes
          cwd: 'assets/'
          src: [ '*.styl', '**/*.styl' ]
          dest: 'dist/'
          ext: '.css'
        }]

    jade:
      compile:
        files: [{
          expand: yes
          cwd: 'assets/'
          src: [ '*.jade', '**/*.jade' ]
          dest: 'public/'
          ext: '.html'
        }]

    uglify:
      minify:
        files: [{
          expand: yes
          cwd: 'dist/'
          src: [ '*.js', '**/*.js' ]
          dest: 'public/'
          ext: '.js'
        }]

    cssmin:
      minify:
        files: [{
          expand: yes
          cwd: 'dist/'
          src: [ '*.css', '**/*.css' ]
          dest: 'public/'
          ext: '.css'
        }]

    simplemocha:
      options:
        ui: 'bdd'
        reporter: 'spec'
        compilers: 'coffee:coffee-script'
        ignoreLeaks: no
      dist:
        src: [ 'tests/test.coffee' ]

    watch:
      dist:
        files: [ '**/*.coffee', 'assets/**/*.jade', 'assets/**/*.styl' ]
        tasks: [ 'test' ]
      #   files: [ 'assets/*.coffee', 'assets/**/*.coffee']
      #   tasks: [ 'coffee', 'uglify' ]
      # jade:
      #   files: [ 'assets/*.jade', 'assets/**/*.jade' ]
      #   tasks: [ 'jade' ]
      # stylus:
      #   files: [ 'assets/*.styl', 'assets/**/*.styl']
      #   tasks: [ 'stylus', 'cssmin' ]
      options:
        interrupt: yes
