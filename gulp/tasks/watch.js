"use strict";

const gulp = require("gulp");
const config = require("../config").config;
const browserSync = require("browser-sync").create();

// グローバルにインスタンスを保存
gulp.browserSync = browserSync;

// ファイル変更を監視します。
gulp.task("watch", ["server"], () => {
	// Assemble
	gulp.watch(`${config.hbsDir}*.hbs`, ["assemble"]);
	gulp.watch(`${config.partialsDir}*.hbs`, ["assemble"]);
	gulp.watch(`${config.distDir}*.html`).on("change", browserSync.reload);
	// Sass
	gulp.watch(`${config.sassDir}**`, ["sassLint", "sass"]);
	// JavaScript
	gulp.watch(`${config.jsSourceDir}**`, ["babelify"]);
	gulp.watch(`${config.distDir}js/*.js`).on("change", browserSync.reload);
});

// ローカルサーバーを起動します。
gulp.task("server", () => {
	browserSync.init({
		server: {
			baseDir: config.distDir
		},
		open: false
	});
});
