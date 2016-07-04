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
	local:
		options:
			transform: [
				"coffeeify"
				"browserify-shim"
				["envify"
					NODE_ENV: "local"
				]
			]
		files:
			"<%= DEV_PC_PATH %><%= JS_DIR %>app.js": [
				"<%= DEV_PC_PATH %><%= COFFEE_DIR %>App.coffee"
			]
	dev_pc:
		options:
			transform: [
				"coffeeify"
				"browserify-shim"
				["envify"
					NODE_ENV: "development"
				]
			]
		files:
			"<%= DEV_PC_PATH %><%= JS_DIR %>app.js": [
				"<%= DEV_PC_PATH %><%= COFFEE_DIR %>App.coffee"
			]
	production_pc:
		options:
			transform: [
				"coffeeify"
				"browserify-shim"
				["envify"
					NODE_ENV: "production"
				]
			]
			plugin: [
				["minifyify",
					map: false
				]
			]
		files:
			"<%= PRODUCTION_PC_PATH %><%= JS_DIR %>app.js": [
				"<%= DEV_PC_PATH %><%= COFFEE_DIR %>App.coffee"
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
