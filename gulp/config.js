'use strict';

const minimist = require("minimist");

// 起動オプションの受け取り
let options = minimist(process.argv.slice(2), {
	string: "env",
	boolean: [
		"isProduction"
	],
	default: {
		isProduction: false
	}
});

// 共通設定
// 出力先ディレクトリの判定
let sourceDir = 'src/';
let distDir = 'dist/';
let destDir = !options.isProduction ? sourceDir : distDir;
let config = {
	// 出力先ディレクトリ
	destDir: `${destDir}`,
	// ソースディレクトリ
	sourceDir: sourceDir,
	// ビルド先ディレクトリ
	distDir: distDir,
	// Handlebarsディレクトリ
	hbsDir: `${sourceDir}**`,
	// Handlebarsデータディレクトリ
	handlebarsDataDir: `${sourceDir}data/`,
	// Handlebarsパーシャルディレクトリ
	partialsDir: `${sourceDir}_includes/`,
	// Handlebarsレイアウトディレクトリ
	layoutsDir: `${sourceDir}_layouts/`,
	// CSSディレクトリ
	cssDir: `${distDir}css/`,
	// CSSファイル名
	cssFilename: 'screen',
	// Sassディレクトリ
	sassDir: `${sourceDir}sass/`,
	// JSソースディレクトリ
	jsSourceDir: `${sourceDir}js/`,
	// JSディレクトリ
	jsDir: `${distDir}js/`,
	// JSファイル名
	jsFilename: 'App.js'
};

module.exports = {
	config: config
};
