module.exports =
	dev:
		options:
			watchTask: true
			server: "<%= DEV_PC_PATH %>"
		bsFiles:
			src: [
				"<%= DEV_PC_PATH %>**/*.html"
				"<%= DEV_PC_PATH %>**/*.css"
				"<%= DEV_PC_PATH %>**/*.js"
			]
