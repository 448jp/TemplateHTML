module.exports =
	css:
		src: [
			"bower_components/normalize-css/normalize.css"
			"<%= DEV_PC_PATH %><%= CSS_DIR %><%= CSS_FILENAME %>"
		]
		dest: "<%= DEV_PC_PATH %><%= CSS_DIR %><%= CSS_FILENAME %>"
	css_production:
		src: [
			"bower_components/normalize-css/normalize.css"
			"<%= PRODUCTION_PC_PATH %><%= CSS_DIR %><%= CSS_FILENAME %>"
		]
		dest: "<%= PRODUCTION_PC_PATH %><%= CSS_DIR %><%= CSS_FILENAME %>"
