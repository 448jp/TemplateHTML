module.exports =
	dev:
		options:
			base: "<%= DEV_PC_PATH %>"
			port: 9000
			livereload: true
	production:
		options:
			base: "production/"
			port: 9000
