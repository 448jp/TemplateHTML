module.exports = (grunt) ->
	options:
		dirs: [
			"<%= DEV_PC_PATH %>**/"
			"!<%= DEV_PC_PATH %>fla/**/"
			"!<%= DEV_PC_PATH %><%= SCSS_DIR %>parts/"
			"<%= DEV_SP_PATH %>**/"
			"!<%= DEV_SP_PATH %><%= SCSS_DIR %>parts/"
			"<%= DEV_FP_PATH %>**/"
		]
		livereload:
			enabled: true
			extensions: ["html", "css", "js"]

	hbs: (filepath) ->
		grunt.config ["assemble", "dev_pc", "files"]
		return ["assemble:dev_pc"]

	scss: (filepath) ->
		return ["compass:dev_pc", "autoprefixer:dev"]

	coffee: (filepath) ->
		return ["browserify:dev_pc"]

	js: (filepath) ->
		return
