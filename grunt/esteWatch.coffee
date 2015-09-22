module.exports = (grunt) ->
	options:
		dirs: [
			"<%= DEV_PC_PATH %>_includes/"
			"<%= DEV_PC_PATH %>_layouts/"
			"<%= DEV_PC_PATH %>coffee/**"
			"<%= DEV_PC_PATH %>css/"
			"<%= DEV_PC_PATH %>data/"
			"<%= DEV_PC_PATH %>js/"
			"<%= DEV_PC_PATH %>sass/**"
			"<%= DEV_PC_PATH %>"
		]
		livereload:
			enabled: true
			extensions: ["html", "css", "js"]

	hbs: (filepath) ->
		grunt.config ["assemble", "dev_pc", "files"]
		return ["assemble:dev_pc"]

	scss: (filepath) ->
		return ["sass:dev_pc", "autoprefixer:dev"]

	coffee: (filepath) ->
		return ["browserify:dev_pc"]

	js: (filepath) ->
		return
