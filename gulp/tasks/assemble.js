'use strict';

const gulp = require('gulp');
const config = require('../config').config;
const assemble = require('assemble');
const helpers = require('handlebars-helpers')();
const extname = require('gulp-extname');
const app = assemble();

// Handlebars関連ファイルを読み込みます。
gulp.task('assemble-load', (callback) => {
	app.partials(`${config.handlebarsPartialsDir}*.hbs`);
	app.layouts(`${config.handlebarsLayoutsDir}*.hbs`);
	app.data(`${config.handlebarsDataDir}website.json`);
	app.pages(`${config.sourceDir}*.hbs`);
	callback();
});

// assembleをコンパイルします。
gulp.task('assemble', ['assemble-load'], () => {
	return app.toStream('pages')
		.pipe(app.renderFile())
		.pipe(extname())
		.pipe(app.dest(config.distDir))
});
