module.exports =
	dev_pc:
		options:
			eol: "crlf"
		files: [
			expand: true
			cwd: "<%= DEV_PC_PATH %>"
			src: [
				"*.html"
			]
			dest: "<%= DEV_PC_PATH %>"
		]
	production_pc:
		options:
			eol: "crlf"
		files: [
			expand: true
			cwd: "<%= DEV_PC_PATH %>"
			src: [
				"*.html"
			]
			dest: "<%= PRODUCTION_PC_PATH %>"
		]