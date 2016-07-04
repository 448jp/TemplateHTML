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
			enabled: false

	hbs: (filepath) ->
		grunt.config ["assemble", "dev_pc", "files"]
		return ["assemble:dev_pc"]

	json: (filepath) ->
		return ["assemble:dev_pc"]

	sass: (filepath) ->
		return ["sass:dev_pc", "autoprefixer:dev", "concat:css"]

	scss: (filepath) ->
		return ["sass:dev_pc", "autoprefixer:dev", "concat:css"]

	coffee: (filepath) ->
		if grunt.option("env") != "local"
			return ["browserify:dev_pc"]
		else
			return ["browserify:local"]

	js: (filepath) ->
		return
