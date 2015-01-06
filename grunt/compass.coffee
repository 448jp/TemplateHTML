module.exports =
	# キャッシュと本体を削除
	clean:
		options:
			clean: true
		files:
			"<%= CSS_FILENAME %>": "<%= SASS_FILENAME %>"
	dev_pc:
		options:
			environment: "development"
			force: true
			sassDir: "<%= DEV_PC_PATH %><%= SASS_DIR %>"
			cssDir: "<%= DEV_PC_PATH %><%= CSS_DIR %>"
			# nested (default), expanded, compact, compressed
			outputStyle: "nested"
			noLineComments: true
			debugInfo: false
			sourcemap: true
		files: [
			"<%= CSS_FILENAME %>": "<%= SASS_FILENAME %>"
			"print.css": "print.scss"
		]
	dev_sp:
		options:
			environment: "development"
			force: true
			sassDir: "<%= DEV_SP_PATH %><%= SASS_DIR %>"
			cssDir: "<%= DEV_SP_PATH %><%= CSS_DIR %>"
			outputStyle: "nested"
			debugInfo: false
			sourcemap: true
		files:
			"<%= CSS_FILENAME %>": "<%= SASS_FILENAME %>"
	production_pc:
		options:
			environment: "production"
			force: true
			sassDir: "<%= DEV_PC_PATH %><%= SASS_DIR %>"
			cssDir: "<%= PRODUCTION_PC_PATH %><%= CSS_DIR %>"
			outputStyle: "compressed"
			debugInfo: false
		files: [
			"<%= CSS_FILENAME %>": "<%= SASS_FILENAME %>"
			"print.css": "print.scss"
		]
	production_sp:
		options:
			environment: "production"
			force: true
			sassDir: "<%= DEV_SP_PATH %><%= SASS_DIR %>"
			cssDir: "<%= DEV_SP_PATH %><%= CSS_DIR %>"
			outputStyle: "compressed"
			debugInfo: false
		files:
			"<%= CSS_FILENAME %>": "<%= SASS_FILENAME %>"