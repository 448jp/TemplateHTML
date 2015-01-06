module.exports =
	dev_pc_base:
		algorithm: "binary-tree"
		src: "<%= DEV_PC_PATH %><%= IMAGE_DIR %>/base/*.png"
		destImg: "<%= DEV_PC_PATH %><%= IMAGE_DIR %>/base.png"
		destCSS: "<%= DEV_PC_PATH %><%= SASS_DIR %>parts/_sprite--base.scss"
		cssTemplate: "<%= DEV_PC_PATH %><%= SASS_DIR %>scss.template.mustache"
		imgPath: "../<%= IMAGE_DIR %>base.png"
		cssVarMap: (sprite) ->
			sprite.name = "sprite--" + sprite.name
			return