module.exports =
	dev_pc:
		files: [
			expand: true
			flatten: false
			cwd: "<%= DEV_PC_PATH %><%= FLA_DIR %>assets/images/"
			src: [
				"**/*"
			]
			dest: "<%= DEV_PC_PATH %><%= IMAGE_DIR %>"
		]
	dev_sp:
		files: [
			expand: true
			flatten: false
			cwd: "<%= DEV_SP_PATH %><%= FLA_DIR %>assets/images/"
			src: [
				"**/*"
			]
			dest: "<%= DEV_SP_PATH %><%= IMAGE_DIR %>"
		]
	production_pc:
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
				"!js/app.js"
				"!**/*.hbs"
				"!**/*.map"
			]
			dest: "<%= PRODUCTION_PC_PATH %>"
		]
	production_sp:
		files: [
			expand: true
			flatten: false
			cwd: "<%= DEV_SP_PATH %><%= IMAGE_DIR %>"
			src: [
				"**/*.{png,gif,jpg,jpeg}"
			]
			dest: "<%= PRODUCTION_SP_PATH %><%= IMAGE_DIR %>"
		,
			expand: true
			flatten: false
			cwd: "<%= DEV_SP_PATH %><%= CSS_DIR %>"
			src: [
				"*.css"
			]
			dest: "<%= PRODUCTION_SP_PATH %><%= CSS_DIR %>"
		,
			expand: true
			flatten: false
			cwd: "<%= DEV_SP_PATH %><%= JS_DIR %>"
			src: [
				"*.js"
			]
			dest: "<%= PRODUCTION_SP_PATH %><%= JS_DIR %>"
		,
			expand: true
			flatten: false
			cwd: "<%= DEV_SP_PATH %><%= PDF_DIR %>"
			src: [
				"*.pdf"
			]
			dest: "<%= PRODUCTION_SP_PATH %><%= PDF_DIR %>"
		,
			expand: true
			flatten: false
			cwd: "<%= DEV_SP_PATH %>"
			src: [
				"**/*.html"
				"**/*.htm"
			]
			dest: "<%= PRODUCTION_SP_PATH %>"
		]
	production_fp:
		files: [
			expand: true
			flatten: false
			cwd: "<%= DEV_FP_PATH %><%= IMAGE_DIR %>"
			src: [
				"**/*.gif"
			]
			dest: "<%= PRODUCTION_FP_PATH %><%= IMAGE_DIR %>"
		,
			expand: true
			flatten: false
			cwd: "<%= DEV_FP_PATH %>"
			src: [
				"**/*.{html,htm}"
			]
			dest: "<%= PRODUCTION_FP_PATH %>"
		]
