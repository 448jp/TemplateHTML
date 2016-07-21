'use strict';

const gulp = require('gulp');
const config = require('../config').config;
const babel = require('gulp-babel');

// JavaScriptをBabelでコンパイルします。
gulp.task('babel', () => {
	return gulp.src(`${config.jsDir}jp/ceroan/${config.jsFilename}`)
		.pipe(babel({
			presets: ['es2015']
		}))
		.pipe(gulp.dest(config.jsDir));
});
