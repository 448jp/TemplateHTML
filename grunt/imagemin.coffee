module.exports =
	# JPEGはimageminで圧縮＆コピー
	production_pc:
		files: [
			expand: true,
			cwd: "<%= DEV_PC_PATH %><%= IMAGE_DIR %>"
			src: [
				"**/*.{jpg,jpeg}"
			],
			dest: "<%= PRODUCTION_PC_PATH %><%= IMAGE_DIR %>"
		]
	production_sp:
		options:
			optimizationLevel: 7
		files: [
			expand: true
			cwd: "<%= DEV_SP_PATH %><%= IMAGE_DIR %>"
			src: ["**/*.{jpg,jpeg}"]
			dest: "<%= PRODUCTION_SP_PATH %><%= IMAGE_DIR %>"
		]