module.exports = {
	options:
		bare: true
	dev_pc:
		files:
			"<%= DEV_PC_PATH %><%= JS_DIR %>app.js": [
				"<%= DEV_PC_PATH %><%= COFFEE_DIR %>config.coffee"
				"<%= DEV_PC_PATH %><%= COFFEE_DIR %>logger.coffee"
				"<%= DEV_PC_PATH %><%= COFFEE_DIR %>MathUtil.coffee"
				"<%= DEV_PC_PATH %><%= COFFEE_DIR %>main.coffee"
			]
	dev_sp:
		files:
			"<%= DEV_SP_PATH %><%= JS_DIR %>app.js": [
				"<%= DEV_SP_PATH %><%= COFFEE_DIR %>config.coffee"
				"<%= DEV_SP_PATH %><%= COFFEE_DIR %>logger.coffee"
				"<%= DEV_SP_PATH %><%= COFFEE_DIR %>ceroan.coffee"
				"<%= DEV_SP_PATH %><%= COFFEE_DIR %>main.coffee"
			]
}