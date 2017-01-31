'use strict';

const gulp = require('gulp');
const config = require('../config').config;
const size = require('gulp-size');

// ファイルをコピーします。
gulp.task('copy', () => {
	return gulp.src([
		`${config.sourceDir}**`,
		`!${config.sourceDir}_includes{,/**}`,
		`!${config.sourceDir}_layouts{,/**}`,
		`!${config.sourceDir}coffee{,/**}`,
		`!${config.sourceDir}data{,/**}`,
		`!${config.sourceDir}js{,/**}`,
		`!${config.sourceDir}sass{,/**}`,
		`!${config.sourceDir}*.hbs`
	], {
		nodir: true
	})
		.pipe(gulp.dest(config.distDir))
		.pipe(size({
			title: "copy"
		}));
});
