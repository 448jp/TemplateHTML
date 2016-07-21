'use strict';

const gulp = require('gulp');
const config = require('../config').config;
const browserSync = require("browser-sync").create();

// ファイル変更を監視します。
gulp.task('watch', ['server'], () => {
	// Assemble
	gulp.watch(`${config.hbsDir}*.hbs`, ['assemble']);
	gulp.watch(`${config.hbsDir}*.html`).on('change', browserSync.reload);
	// Sass
	gulp.watch(`${config.sassDir}**`, ['sass']);
	gulp.watch(`${config.cssDir}*.css`).on('change', browserSync.reload);
	// JavaScript
	gulp.watch(`${config.jsDir}**`, ['babel']);
	gulp.watch(`${config.jsDir}*.js`).on('change', browserSync.reload);
});

// ローカルサーバーを起動します。
gulp.task('server', () => {
	browserSync.init({
		server: {
			baseDir: config.sourceDir
		},
		open: false
	});
});
