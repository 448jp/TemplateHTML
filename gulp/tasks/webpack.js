const gulp = require("gulp");
const config = require("../config").config;
const path = require("path");
const gulpUtil = require("gulp-util");
const webpack = require("webpack");
const webpackConfig = require("../../webpack.config.babel");

// webpackでJavaScriptをコンパイルします。
gulp.task("webpack", ["eslint"], done => {
	webpack(webpackConfig, (error, stats) => {
		if (error) {
			throw new gulpUtil.PluginError("webpack", error);
		}

		/*gulpUtil.log("[webpack]", stats.toString({
			colors: true
		}));*/

		done();
	});
});

// キャッシュのためwebpackコンパイラーのインスタンスを作成
const devCompiler = webpack(webpackConfig);

// webpackでJavaScriptをコンパイルします。
gulp.task("webpack:dev", ["eslint"], done => {
	devCompiler.run((error, stats) => {
		if (error) {
			throw new gulpUtil.PluginError("webpack", error);
		}

		/*gulpUtil.log("[webpack]", stats.toString({
			colors: true
		}));*/

		done();
	});
});
