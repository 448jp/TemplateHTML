/*
// ファイルのコピー
gulp.task "copy", ->
return gulp.src([
	"./dev/**"
	"!dev/coffee{,/**}"
	"!dev/css{,/**}"
	"!dev/sp/css/add**"
	"!dev/js{,/**}"
	"!dev/sp/js/app.js"
	"!dev/sp/js/lib.js"
	"!dev/{,sp/}libs{,/**}"
	"!dev/{,sp/}libs_from_non-bower{,/**}"
	"!dev/{,sp/}sass{,/**}"
])
	.pipe(gulp.dest("./production/"))
	.pipe($.size({title: "copy"}))

// ローカルサーバー
gulp.task "server", ->
browserSync
server:
	baseDir: "./src"
startPath: "/"

// 監視
gulp.task "watch", ["server"], () ->
	gulp.watch "./dev/sp/sass/**", ->
runSequence("sass", ["css:pc", "css:sp"])
gulp.watch("./dev/coffee/**", ["coffee:pc", "coffee:sp"])
gulp.watch("./dev/{,sp/}css/*.css").on("change", browserSync.reload)
gulp.watch("./dev/js/*.js").on("change", browserSync.reload)

gulp.task "default", (callback) ->
	runSequence("clean", "sass", ["css:pc", "css:sp", "js:pc", "js:sp", "coffee:pc", "coffee:sp", "copy"], callback)
*/
