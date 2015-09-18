module.exports =
	# 画像はimageminでコピーする
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
			# GIFは何もせずコピー
			expand: true
			flatten: false
			cwd: "<%= DEV_PC_PATH %><%= IMAGE_DIR %>"
			src: [
				"**/*.gif"
			]
			dest: "<%= PRODUCTION_PC_PATH %><%= IMAGE_DIR %>"
		,
			expand: true
			flatten: false
			cwd: "<%= DEV_PC_PATH %><%= JS_DIR %>"
			src: [
				"*.js"
			]
			dest: "<%= PRODUCTION_PC_PATH %><%= JS_DIR %>"
		,
			expand: true
			flatten: false
			cwd: "<%= DEV_PC_PATH %><%= FONT_DIR %>"
			src: [
				"*"
			]
			dest: "<%= PRODUCTION_PC_PATH %><%= FONT_DIR %>"
		,
			expand: true
			flatten: false
			cwd: "<%= DEV_PC_PATH %><%= SWF_DIR %>"
			src: [
				"*.pdf"
			]
			dest: "<%= PRODUCTION_PC_PATH %><%= SWF_DIR %>"
		,
			expand: true
			flatten: false
			cwd: "<%= DEV_PC_PATH %><%= MEDIA_DIR %>"
			src: [
				"*.*"
			]
			dest: "<%= PRODUCTION_PC_PATH %><%= MEDIA_DIR %>"
		,
			expand: true
			flatten: false
			cwd: "<%= DEV_PC_PATH %><%= HANDLEBARS_DATA_DIR %>"
			src: [
				"quotes.json"
			]
			dest: "<%= DEV_PC_PATH %>"
		,
			expand: true
			flatten: false
			cwd: "<%= DEV_PC_PATH %>"
			src: [
				"**/*.html"
				"*.json"
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
