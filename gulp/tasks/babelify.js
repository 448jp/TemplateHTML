'use strict';

const gulp = require('gulp');
const config = require('../config').config;
const browserify = require('browserify');
const babelify = require('babelify');
const watchify = require('watchify');
const plumber = require('gulp-plumber');
const source = require('vinyl-source-stream');

// JavaScriptをBabelでコンパイルします。
gulp.task('babelify', () => {
	return browserify({
		entries: `${config.jsSourceDir}jp/ceroan/${config.jsFilename}`,
		extensions: [".js"],
		cache: {},
		packageCache: {},
		plugin: [watchify]
	})
		.transform(babelify, {
			presets: ['es2015', 'stage-2']
		})
		.bundle()
		.on('error', function(error) {
			this.emit('end');
		})
		.pipe(plumber())
		.pipe(source('app.js'))
		.pipe(gulp.dest(config.jsDir));
});
