module.exports =
	dev_fp:
		files: [
			expand: true
			cwd: "<%= DEV_FP_PATH %>"
			src: [
				"**/*.html"
			]
			dest: "<%= DEV_FP_PATH %>"
		]