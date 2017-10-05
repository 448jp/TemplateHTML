const gulp = require("gulp");
const config = require("../config").config;
const eslint = require("gulp-eslint");

// ESLintでlintします。
gulp.task("eslint", () => {
	return gulp
		.src(`${config.jsSourceDir}${config.jsSourcePath}**/*.js`)
		.pipe(eslint())
		.pipe(eslint.format())
		.pipe(eslint.failAfterError());
});
