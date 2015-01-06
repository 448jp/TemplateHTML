module.exports =
	install_pc:
		options:
			targetDir: "<%= DEV_PC_PATH %><%= LIB_DIR %>"
			layout: "byType"
			install: false
			verbose: true
			cleanTargetDir: false
			cleanBowerDir: false
	install_sp:
		options:
			targetDir: "<%= DEV_SP_PATH %><%= LIB_DIR %>"
			layout: "byType"
			install: false
			verbose: true
			cleanTargetDir: false
			cleanBowerDir: false