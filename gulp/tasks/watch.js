"use strict";

const gulp = require("gulp");
const config = require("../config").config;
const browserSync = require("browser-sync").create();

// グローバルにインスタンスを保存
gulp.browserSync = browserSync;

// ファイル変更を監視します。
gulp.task("watch", ["server"], done => {
	// Assemble
	gulp.watch(`${config.handlebarsDir}*.hbs`, ["assemble"]);
	gulp.watch(`${config.handlebarsPartialsDir}*.hbs`, ["assemble"]);
	gulp.watch(`${config.distDir}*.html`).on("change", browserSync.reload);

	// Sass
	gulp.watch(`${config.sassDir}**`, ["sassLint", "sass"]);

	// JavaScript
	// by webpack
	gulp.watch(`${config.jsSourceDir}**`, ["webpack"]);
	// by Browserify
	// gulp.watch(`${config.jsSourceDir}**`, ["watchify"]);
	gulp.watch(`${config.distDir}js/*.js`).on("change", browserSync.reload);

	// Images
	gulp.watch(`${config.imagesDir}**`, ["copy"]);

	done();
});

// ローカルサーバーを起動します。
gulp.task("server", ["default"], done => {
	browserSync.init({
		server: {
			baseDir: config.distDir
		},
		// 自動的に開く: true / local / external / ui / ui-external / tunnel / false
		open: "external",
		// 通知ポップアップ: true / false (default: false)
		notify: false,
		rewriteRules: [
			/*
			SSI対応
			{
				match: /<!--#include virtual="(.+?)" -->/g,
				fn(req, res, match, filename) {
					const includeFilePath = path.join(`${__dirname}/../../dist/`, filename);
					if (fs.existsSync(includeFilePath)) {
						return fs.readFileSync(includeFilePath);
					} else {
						return `<span style="color: red">\`${includeFilePath}\` could not be found</span>`;
					}
				}
			}
			*/
		]
	});
	done();
});
