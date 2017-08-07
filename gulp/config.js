"use strict";

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
let sourceDir = "src/";
let distDir = "dist/";
let destDir = !options.isProduction ? sourceDir : distDir;
let config = {
	// 出力先ディレクトリ
	destDir: `${destDir}`,
	// ソースディレクトリ
	sourceDir: sourceDir,
	// ビルド先ディレクトリ
	distDir: distDir,

	// ディレクトリ名

	// Handlebarsディレクトリ
	handlebarsDir: `${sourceDir}**`,
	// Handlebarsパーシャルディレクトリ
	handlebarsPartialsDir: `${sourceDir}_includes/`,
	// Handlebarsレイアウトディレクトリ
	handlebarsLayoutsDir: `${sourceDir}_layouts/`,
	// Handlebarsデータディレクトリ
	handlebarsDataDir: `${sourceDir}data/`,

	// CSSディレクトリ
	cssDir: `${distDir}css/`,
	// Sassディレクトリ
	sassDir: `${sourceDir}sass/`,

	// 画像ディレクトリ
	imagesDir: `images/`,

	// JSソースディレクトリ
	jsSourceDir: `${sourceDir}js/`,
	// JSソースパス
	jsSourcePath: "",
	// JSディレクトリ
	jsDir: `${distDir}js/`,

	// フォントディレクトリ
	fontsDir: "fonts/",
	// PDFディレクトリ
	pdfDir: "pdf/",
	// メディアディレクトリ
	mediaDir: "media/",

	// ファイル名

	// CSSファイル名
	cssFilename: "screen",
	// JSファイル名
	jsFilename: "App.js"
};

module.exports = {
	config: config
};
