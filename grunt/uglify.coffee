module.exports =
	options:
		preserveComments: "some"
	dev_pc:
		files:
			"<%= DEV_PC_PATH %><%= JS_DIR %>app.js": [
				"<%= DEV_PC_PATH %><%= JS_DIR %>app.js"
			]
			"<%= DEV_PC_PATH %><%= JS_DIR %>libs.js": [
				"<%= DEV_PC_PATH %><%= LIB_DIR %>**/license.js"
				"<%= DEV_PC_PATH %><%= LIB_DIR %>**/jquery.min.js"
				"<%= DEV_PC_PATH %><%= LIB_DIR %>**/jquery.easing.1.3.min.js"
				"<%= DEV_PC_PATH %><%= LIB_DIR %>**/velocity.min.js"
				"<%= DEV_PC_PATH %><%= LIB_DIR %>**/velocity.ui.min.js"
				"<%= DEV_PC_PATH %><%= LIB_DIR %>**/jquery.cookie.js"
				"<%= DEV_PC_PATH %><%= LIB_DIR %>**/skrollr.min.js"
				"<%= DEV_PC_PATH %><%= LIB_DIR %>**/ruby_enabler.js"
				"<%= DEV_PC_PATH %><%= LIB_DIR %>**/easestepper.min.js"
				"<%= DEV_PC_PATH %><%= LIB_DIR %>**/jquery.easescroller.min.js"
			]
	dev_sp:
		files:
			"<%= DEV_SP_PATH %><%= JS_DIR %>app.js": [
				"<%= DEV_SP_PATH %><%= JS_DIR %>app.js"
			]
			"<%= DEV_SP_PATH %><%= JS_DIR %>libs.js": [
				"<%= DEV_SP_PATH %><%= LIB_DIR %>**/jquery.min.js"
				"<%= DEV_SP_PATH %><%= LIB_DIR %>**/jquery.transit.fix.js"
				"<%= DEV_SP_PATH %><%= LIB_DIR %>**/hammer.min.js"
				"<%= DEV_SP_PATH %><%= LIB_DIR %>**/jquery.hammer.js"
				"<%= DEV_SP_PATH %><%= LIB_DIR %>**/addtohomescreen.fix.js"
				"<%= DEV_SP_PATH %><%= LIB_DIR %>**/preloadjs-0.4.1.min.js"
				"<%= DEV_SP_PATH %><%= LIB_DIR %>**/tweenjs-0.5.1.min.js"
				"<%= DEV_SP_PATH %><%= LIB_DIR %>**/easeljs-0.7.1.min.js"
				"<%= DEV_SP_PATH %><%= LIB_DIR %>**/movieclip-0.7.1.min.js"
			]