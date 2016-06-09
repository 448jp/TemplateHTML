require("jquery")
Root = require("./Root")

module.exports = class ExEventManager
	constructor: () ->
		@RESIZE_INTERVAL = 100
		@resizeTimer = new Date().getTime()
		@resizeTimerId = undefined
		@resizeFuncs = []
		@SCROLL_INTERVAL = 15
		@scrollTimer = new Date().getTime()
		@scrollTimerId = undefined
		@$window = $(window)

	# 初期化
	init: () =>
		@on()
		@atResize()

	# リサイズ処理
	resizeHandler: () =>
		# 適当な間隔でイベントを間引いて実行
		clearTimeout(@resizeTimerId)
		@resizeTimerId = setTimeout(() =>
			@atResize()
		, @RESIZE_INTERVAL)

	atResize: () =>
		if @resizeFuncs.length == 0
			return
		for i in [0..@resizeFuncs.length - 1]
			@resizeFuncs[i]()

	# スクロール処理
	scrollHandler: () =>
		# 適当な間隔でイベントを間引いて実行
		clearTimeout(@scrollTimerId)
		@scrollTimerId = setTimeout(() =>
			_windowScrollTop = @$window.scrollTop()
		, @SCROLL_INTERVAL)

	on: () =>
		@$window.on "resize", @resizeHandler
		@$window.on "scroll", @scrollHandler

	off: () =>
		@$window.off()
