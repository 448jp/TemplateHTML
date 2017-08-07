"use strict";

const gulp = require("gulp");
const config = require("../config").config;
const del = require("del");

// ビルドディレクトリを削除します。
gulp.task("clean", () => {
	return del([
		config.distDir
	]);
});
