module.exports =
	dev:
		options:
			watchTask: true
			server: "<%= DEV_PC_PATH %>"
			open: false
		bsFiles:
			src: [
				"<%= DEV_PC_PATH %>**/*.html"
				"<%= DEV_PC_PATH %>**/*.css"
				"<%= DEV_PC_PATH %>**/*.js"
			]
