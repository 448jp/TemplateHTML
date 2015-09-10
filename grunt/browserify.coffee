module.exports =
	options:
		browserifyOptions:
			debug: true
			extensions: [".js", ".coffee"]
		transform: [
			"coffeeify"
			"browserify-shim"
		]
		plugin: [
			["minifyify",
				map: "app.js.map"
				output: "<%= DEV_PC_PATH %><%= JS_DIR %>app.js.map"
				exclude: [
					"bower_components/**/*.js"
				]
			]
		]
	dev_pc:
		files:
			"<%= DEV_PC_PATH %><%= JS_DIR %>app.js": [
				"<%= DEV_PC_PATH %><%= COFFEE_DIR %>App.coffee"
			]
	production_pc:
		options:
			plugin: [
				["minifyify",
					map: false
				]
			]
		files:
			"<%= PRODUCTION_PC_PATH %><%= JS_DIR %>app.js": [
				"<%= DEV_PC_PATH %><%= COFFEE_DIR %>**/*.coffee"
			]
	dev_sp:
		options:
			plugin: [
				["minifyify",
					map: "app.js.map"
					output: "<%= DEV_SP_PATH %><%= JS_DIR %>app.js.map"
					exclude: [
						"bower_components/**/*.js"
					]
				]
			]
		files:
			"<%= DEV_SP_PATH %><%= JS_DIR %>app.js": [
				"<%= DEV_PC_PATH %><%= COFFEE_DIR %>**/*.coffee"
			]
	production_sp:
		options:
			plugin: [
				["minifyify",
					map: false
				]
			]
		files:
			"<%= PRODUCTION_SP_PATH %><%= JS_DIR %>app.js": [
				"<%= DEV_PC_PATH %><%= COFFEE_DIR %>**/*.coffee"
			]
