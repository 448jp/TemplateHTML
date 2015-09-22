module.exports =
	dev_pc:
		options:
			force: true
			# nested (default), expanded, compact, compressed
			style: "nested"
			debugInfo: false
		files:
			"<%= DEV_PC_PATH %><%= CSS_DIR %><%= CSS_FILENAME %>": "<%= DEV_PC_PATH %><%= SASS_DIR %><%= SASS_FILENAME %>"
	dev_sp:
		options:
			force: true
			style: "nested"
			debugInfo: false
		files:
			"<%= DEV_SP_PATH %><%= CSS_DIR %><%= CSS_FILENAME %>": "<%= DEV_SP_PATH %><%= SASS_DIR %><%= SASS_FILENAME %>"
	production_pc:
		options:
			force: true
			style: "compressed"
			debugInfo: false
		files:
			"<%= DEV_PC_PATH %><%= CSS_DIR %><%= CSS_FILENAME %>": "<%= DEV_PC_PATH %><%= SASS_DIR %><%= SASS_FILENAME %>"
	production_sp:
		options:
			force: true
			style: "compressed"
			debugInfo: false
		files:
			"<%= DEV_SP_PATH %><%= CSS_DIR %><%= CSS_FILENAME %>": "<%= DEV_SP_PATH %><%= SASS_DIR %><%= SASS_FILENAME %>"
