"use strict";

setTimeout(function () {
	var hoge = arguments.length <= 0 || arguments[0] === undefined ? "ほげ" : arguments[0];

	console.log(hoge);
}, 500);