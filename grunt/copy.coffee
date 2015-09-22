module.exports =
	production:
		files: [
			expand: true
			flatten: false
			cwd: "<%= DEV_PC_PATH %>"
			src: [
				"**/*"
				"!<%= COFFEE_DIR %>**"
				"!<%= HANDLEBARS_PARTIAL_DIR %>**"
				"!<%= HANDLEBARS_LAYOUTS_DIR %>**"
				"!<%= HANDLEBARS_DATA_DIR %>**"
				"!<%= SASS_DIR %>**"
				"!**/*.map"
				"!**/*.hbs"
			]
			dest: "<%= PRODUCTION_PC_PATH %>"
		]
