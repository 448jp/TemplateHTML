module.exports = (grunt) ->
	dev_pc:
		options:
			assets: "<%= DEV_PC_PATH %>"
			partials: ["<%= DEV_PC_PATH %>_includes/*.hbs"]
			layoutdir: "<%= DEV_PC_PATH %>_layouts/"
			data: "<%= DEV_PC_PATH %><%= HANDLEBARS_DATA_DIR %>website.json"
			ext: ".html"
		files: [
			expand: true
			cwd: "<%= DEV_PC_PATH %>"
			src: [
				"**/*.hbs"
				"!_includes/*.hbs"
				"!_layouts/*.hbs"
			]
			dest: "<%= DEV_PC_PATH %>"
		]
	dev_sp:
		options:
			assets: "<%= DEV_SP_PATH %>"
			partials: ["<%= DEV_SP_PATH %>_includes/*.hbs"]
			layoutdir: "<%= DEV_SP_PATH %>_layouts/"
			data: "<%= DEV_SP_PATH %><%= HANDLEBARS_DATA_DIR %>website.json"
			ext: ".html"
		files: [
			expand: true
			cwd: "<%= DEV_SP_PATH %>"
			src: [
				"**/*.hbs"
				"!_includes/*.hbs"
				"!_layouts/*.hbs"
			]
			dest: "<%= DEV_SP_PATH %>"
		]
	dev_fp:
		options:
			assets: "<%= DEV_FP_PATH %>"
			partials: ["<%= DEV_FP_PATH %>_includes/*.hbs"]
			layoutdir: "<%= DEV_FP_PATH %>_layouts/"
			data: "<%= DEV_FP_PATH %><%= HANDLEBARS_DATA_DIR %>website.json"
			ext: ".html"
		files: [
			expand: true
			cwd: "<%= DEV_FP_PATH %>"
			src: [
				"**/*.hbs"
				"!_includes/*.hbs"
				"!_layouts/*.hbs"
			]
			dest: "<%= DEV_FP_PATH %>"
		]