module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

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

    watch:
      coffee:
        files: [ 'assets/*.coffee', 'assets/**/*.coffee']
        tasks: [ 'coffee', 'uglify' ]
      jade:
        files: [ 'assets/*.jade', 'assets/**/*.jade' ]
        tasks: [ 'jade' ]
      stylus:
        files: [ 'assets/*.styl', 'assets/**/*.styl']
        tasks: [ 'stylus', 'cssmin' ]
      options:
        spawn: no
        interrupt: yes

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee', 'uglify', 'stylus', 'cssmin', 'jade', 'watch']
  grunt.registerTask 'build', ['coffee', 'uglify', 'stylus', 'cssmin', 'jade']
