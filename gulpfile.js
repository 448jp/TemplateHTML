'use strict';

const gulp = require('gulp');
const requireDir = require('require-dir');
const runSequence = require("run-sequence");

// タスクを読み込み
requireDir('./gulp/tasks', {recurse: true});

// デフォルトタスク
gulp.task('default', (done) => {
	runSequence('clean', ['assemble', 'sass', 'babelify'], "sassLint", 'copy', done);
});
