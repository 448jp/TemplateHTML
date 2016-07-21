'use strict'

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
let destDir = !options.isProduction ? sourceDir : 'dist/';
let config = {
	// 出力先ディレクトリ
	destDir: `${destDir}`,
	// CSSディレクトリ
	cssDir: `${destDir}css/`,
	// CSSファイル名
	cssFilename: 'screen',
	// Sassディレクトリ
	sassDir: `${sourceDir}sass/`,
	// JSディレクトリ
	jsDir: `${sourceDir}js/`,
	// JSファイル名
	jsFilename: 'App.js'
};

module.exports = {
	config: config
};
