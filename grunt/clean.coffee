module.exports =
	production_pc:
		src: [
			"<%= PRODUCTION_PC_PATH %><%= CSS_DIR %>"
			"<%= PRODUCTION_PC_PATH %><%= JS_DIR %>"
			"<%= PRODUCTION_PC_PATH %>*.html"
		]
	production_sp:
		src: [
			"<%= PRODUCTION_SP_PATH %><%= CSS_DIR %>"
			"<%= PRODUCTION_SP_PATH %><%= JS_DIR %>"
			"<%= PRODUCTION_SP_PATH %><%= FONT_DIR %>"
			"<%= PRODUCTION_SP_PATH %>*.html"
		]
	production_fp:
		src: [
			"<%= PRODUCTION_FP_PATH %>*"
		]