'use strict';

const gulp = require('gulp');
const requireDir = require('require-dir');
const runSequence = require("run-sequence");

// タスクを読み込み
requireDir('./gulp/tasks', {recurse: true});

// デフォルトタスク
gulp.task('default', (callback) => {
	runSequence('clean', ['assemble', 'sass', 'babel'], 'copy', callback);
});