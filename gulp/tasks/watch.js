"use strict";

const gulp = require("gulp");
const config = require("../config").config;
const browserSync = require("browser-sync").create();

// グローバルにインスタンスを保存
gulp.browserSync = browserSync;

// ファイル変更を監視します。
gulp.task("watch", ["server"], (done) => {
	// Assemble
	gulp.watch(`${config.handlebarsDir}*.hbs`, ["assemble"]);
	gulp.watch(`${config.handlebarsPartialsDir}*.hbs`, ["assemble"]);
	gulp.watch(`${config.distDir}*.html`).on("change", browserSync.reload);
	// Sass
	gulp.watch(`${config.sassDir}**`, ["sassLint", "sass"]);
	// JavaScript
	gulp.watch(`${config.jsSourceDir}**`, ["watchify"]);
	gulp.watch(`${config.distDir}js/*.js`).on("change", browserSync.reload);

	done();
});

// ローカルサーバーを起動します。
gulp.task("server", (done) => {
	browserSync.init({
		server: {
			baseDir: config.distDir
		},
		// 自動的に開く: true / local / external / ui / ui-external / tunnel / false
		open: false,
		// 通知ポップアップ: true / false (default: false)
		notify: false
	});
	done();
});
