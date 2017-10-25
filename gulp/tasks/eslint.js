const gulp = require("gulp");
const config = require("../config").config;
const eslint = require("gulp-eslint");

// ESLintでlintします。
gulp.task("eslint", () => {
	return gulp
		.src(`${config.jsSourceDir}${config.jsSourcePath}**/*.js`)
		.pipe(eslint())
		.pipe(eslint.format())

		// lintエラーのときはタスクの実行を失敗とする
		// .pipe(eslint.failAfterError());
});
