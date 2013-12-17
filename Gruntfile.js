module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-shell');

  grunt.initConfig({

    coffee: {
      glob_to_multiple: {
        expand: true,
        flatten: true,
        cwd: 'lib/',
        src: ['*.coffee'],
        dest: 'lib/compiled/',
        ext: '.js'
      }
    },

    watch: {
      js: {
        files: ['lib/**/*.coffee', 'spec/**/*-spec.coffee'],
        tasks: ['test', 'coffee']
      }
    },

    shell: {
      test: {
        options: { stdout: true },
        command: 'jasmine-node --coffee spec'
      }
    }
  });

  grunt.registerTask('test', 'shell:test');
}
