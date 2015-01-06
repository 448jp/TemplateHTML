module.exports =
	# PNGはTinyPNGで圧縮＆コピー
	options:
		apiKey: "<%= config.tinypngApiKey %>"
		summarize: true
		showProgress: true
	production_pc:
		files: [
			expand: true,
			cwd: "<%= DEV_PC_PATH %><%= IMAGE_DIR %>",
			src: [
				"**/*.png"
				"!base/*"
				"!individual/*/*"
			],
			dest: "<%= PRODUCTION_PC_PATH %><%= IMAGE_DIR %>"
		]
	production_sp:
		files: [
			expand: true,
			cwd: "<%= DEV_SP_PATH %><%= IMAGE_DIR %>",
			src: [
				"**/*.png"
			],
			dest: "<%= PRODUCTION_SP_PATH %><%= IMAGE_DIR %>"
		]