"use strict";

const gulp = require("gulp");
const config = require("../config").config;
const sass = require("gulp-sass");
const autoprefixer = require("gulp-autoprefixer");
const stylelint = require("gulp-stylelint");
const sassLint = require("gulp-sass-lint");
const concat = require("gulp-concat");
const browserSync = require("browser-sync").create();

// Sassをコンパイルします。
gulp.task("sass", () => {
	return gulp.src(`${config.sassDir}${config.cssFilename}.{sass,scss}`)
		.pipe(sass())
		.pipe(autoprefixer({
			// see: https://github.com/ai/browserslist#queries
			browsers: ["last 2 versions", "IE >= 9"],
			cascade: false
		}))
		.pipe(gulp.dest(config.cssDir))
		.pipe(gulp.browserSync.stream());
});

/**
 * stylelintでscssファイルをlintします。
 */
gulp.task("stylelint", (done) => {
	return gulp.src(`${config.sassDir}**/*.scss`)
		.pipe(stylelint({
			syntax: "scss",
			reporters: [
				{
					formatter: "string",
					console: true
				}
			]
		}));
});

// Sassをsass-lintします。
gulp.task("sassLint", () => {
	return gulp.src(`${config.sassDir}**/*.{sass,scss}`)
		.pipe(sassLint({
			configFile: ".sass-lint.yml"
		}))
		.pipe(sassLint.format());
});

// Normalize.cssとCSSを結合します。
gulp.task("normalize", () => {
	return gulp.src([
		"./node_modules/normalize.css/normalize.css",
		`${config.cssDir}${config.cssFilename}.css`
	])
		.pipe(concat(`${config.cssFilename}.css`))
		.pipe(gulp.dest(config.cssDir))
});
