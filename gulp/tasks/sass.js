'use strict';

const gulp = require('gulp');
const config = require('../config').config;
const sass = require('gulp-sass');
const autoprefixer = require('gulp-autoprefixer');
const concat = require("gulp-concat");

// Sassをコンパイルします。
gulp.task('sass', () => {
	return gulp.src(`${config.sassDir}${config.cssFilename}.sass`)
		.pipe(sass())
		.pipe(autoprefixer({
			// see: https://github.com/ai/browserslist#queries
			browsers: ['last 2 versions', 'IE >= 9'],
			cascade: false
		}))
		.pipe(gulp.dest(config.cssDir));
});

// Normalize.cssとCSSを結合します。
gulp.task('normalize', () => {
	return gulp.src([
			'./node_modules/normalize.css/normalize.css',
			`${config.cssDir}${config.cssFilename}.css`
		])
		.pipe(concat(`${config.cssFilename}.css`))
		.pipe(gulp.dest(config.cssDir))
});