"use strict";

const gulp = require("gulp");
const config = require("../config").config;
const browserify = require("browserify");
const babelify = require("babelify");
const watchify = require("watchify");
const plumber = require("gulp-plumber");
const source = require("vinyl-source-stream");

// browserify実行時のデフォルトオプション
const browserifyOptions = {
	entries: `${config.jsSourceDir}jp/ceroan/${config.jsFilename}`,
	extensions: [".js"]
};
// babelify実行時のデフォルトオプション
const babelifyOptions = {
	presets: ["es2015", "stage-2"]
};

function compile(options, done) {
	browserify(options).transform(babelify, babelifyOptions)
		.bundle()
		.on("error", function(error) {
			this.emit("end");
		})
		.on("end", () => {
			done();
		})
		.pipe(plumber())
		.pipe(source("app.js"))
		.pipe(gulp.dest(config.jsDir));
}

// browserify + babelifyでJavaScriptをコンパイルします。
gulp.task("babelify", (done) => {
	compile(browserifyOptions, done);
});

// browserify + babelify + watchifyでJavaScriptをコンパイルし、監視をします。
gulp.task("watchify", (done) => {
	// browserify + watchify実行時のオプション（デフォルトオプションを上書き）
	const newOptions = Object.assign(browserifyOptions, {
		cache: {},
		packageCache: {},
		plugin: [watchify]
	});

	compile(newOptions, done);
});
