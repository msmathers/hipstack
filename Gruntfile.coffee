module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-coffee-react'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-sass'

  grunt.initConfig
    clean: ['lib', 'static']

    cjsx:
      compile:
        options:
          bare: true
          sourceMap: true
        files:
          'static/js/lib.js': [
            'src/app/lib/*.coffee'
          ]
          'static/js/app.js': [
            'src/app/components/*.cjsx'
            'src/app/main.cjsx'
          ]

    sass:
      dist:
        files:
          'static/css/styles.css': ['styles/**.scss']

    watch:
      components:
        files: [
          'src/app/lib/*.coffee'
          'src/app/components/*.cjsx'
          'src/app/main.cjsx'
        ]
        tasks: ['cjsx']
      styles:
        files: ['styles/**.scss']
        tasks: ['sass']

    nodemon:
      server:
        script: 'src/server/main.coffee'

    concurrent:
      server:
        tasks: ['nodemon', 'watch']
        options:
          logConcurrentOutput: true

  grunt.registerTask 'build', [
    'cjsx'
    'sass'
  ]

  grunt.registerTask 'server', ['concurrent:server']

  grunt.registerTask 'default', ['build', 'server']
