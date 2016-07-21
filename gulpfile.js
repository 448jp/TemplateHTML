'use strict';

const gulp = require('gulp');
const requireDir = require('require-dir');
/*
$ = require("gulp-load-plugins")();
runSequence = require("run-sequence");
addsrc = require("gulp-add-src");
gulpif = require("gulp-if");

uglify = require("gulp-uglify");
browserSync = require("browser-sync");
*/

// タスクを読み込み
requireDir('./gulp/tasks', {recurse: true});
