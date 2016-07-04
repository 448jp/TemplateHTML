module.exports =
	dev:
		files:
			"<%= DEV_PC_PATH %><%= CSS_DIR %><%= CSS_FILENAME %>": "<%= DEV_PC_PATH %><%= CSS_DIR %><%= CSS_FILENAME %>"
	production:
		options:
			cascade: false
		files:
			"<%= PRODUCTION_PC_PATH %><%= CSS_DIR %><%= CSS_FILENAME %>": "<%= PRODUCTION_PC_PATH %><%= CSS_DIR %><%= CSS_FILENAME %>"
