"use strict";

const gulp = require("gulp");
const config = require("../config").config;
const assemble = require("assemble");
const helpers = require("handlebars-helpers")();
const extname = require("gulp-extname");
const app = assemble();

// Handlebars関連ファイルを読み込みます。
gulp.task("assemble-load", (done) => {
	app.partials(`${config.handlebarsPartialsDir}*.hbs`);
	app.layouts(`${config.handlebarsLayoutsDir}*.hbs`);
	app.data(`${config.handlebarsDataDir}website.json`);
	app.pages(`${config.sourceDir}*.hbs`);

	// Assembleの古いビルトイン変数にアクセス可能にする
	// https://github.com/assemble/assemble/issues/829
	const get = require("get-value");
	app.engine("hbs", require("engine-handlebars"));
	app.helper("get", function(prop) {
		return get(this.context, prop);
	});

	done();
});

// assembleをコンパイルします。
gulp.task("assemble", ["assemble-load"], () => {
	return app.toStream("pages")
		.pipe(app.renderFile())
		.pipe(extname())
		.pipe(app.dest(config.distDir))
});
