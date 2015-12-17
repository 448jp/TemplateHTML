module.exports = function(grunt) {
	require("load-grunt-config")(grunt, {
		config: {
			BASE_PATH: "",
			DEV_PC_PATH: "<%= BASE_PATH %>src/",
			DEV_SP_PATH: "<%= BASE_PATH %>src/sp/",
			DEV_FP_PATH: "<%= BASE_PATH %>src/fp/",
			PRODUCTION_PC_PATH: "<%= BASE_PATH %>dist/",
			PRODUCTION_SP_PATH: "<%= BASE_PATH %>dist/sp/",
			PRODUCTION_FP_PATH: "<%= BASE_PATH %>dist/fp/",

			// プロジェクト設定
			BOWER_COMPONENTS_DIR: "bower_components/",
			ASSETS_DIR: "assets/",

			// ディレクトリ名
			HANDLEBARS_DIR: "hbs/",
			HANDLEBARS_PARTIAL_DIR: "_includes/",
			HANDLEBARS_LAYOUTS_DIR: "_layouts/",
			HANDLEBARS_DATA_DIR: "data/",
			JEKYLL_DIR: "jekyll/",
			LIB_DIR: "libs/",
			IMAGE_DIR: "images/",
			SASS_DIR: "sass/",
			CSS_DIR: "css/",
			COFFEE_DIR: "coffee/",
			TS_DIR: "ts/",
			JS_DIR: "js/",
			FONT_DIR: "fonts/",
			PDF_DIR: "pdf/",
			FLA_DIR: "fla/",
			SWF_DIR: "swf/",
			MEDIA_DIR: "media/",

			SASS_FILENAME: "screen.sass",
			CSS_FILENAME: "screen.css"
		},
		loadGruntTasks: {
			pattern: [
				"assemble",
				"grunt-*"
			],
			scope: "devDependencies"
		}
	});
};
