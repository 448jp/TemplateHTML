(($) ->
	pluginName = "ceroan"
	$[pluginName] = $.sub()

	###
	  ロールオーバー
	  @param options
	  @return {*}
	  ###
	$[pluginName].fn.rollover = (options) ->
		_options = $.extend($[pluginName].fn.rollover.defaults, options)
		_check = new RegExp(_options.over + "\\.\\w+$")
		@each ->
			_this = $(this)
			_srcUp = _this.attr("src")

			# 既にロールオーバー状態だったら何もしない
			return  if _check.test(_srcUp)
			_srcOver = _srcUp.replace(/^(.+)(\.[^\.]+)$/, "$1" + _options.over + "$2")
			_preloadImg = new Image()
			_preloadImg.src = _srcOver
			_this.hover (->
				_this.attr "src", _srcOver
				return
			), ->
				_this.attr "src", _srcUp
				return

			return

		this


	###
	  ロールオーバーのデフォルト設定
	  @type {Object}
	  ###
	$[pluginName].fn.rollover.defaults = over: "_over"

	###
	  スムーズスクロール
	  @param options
	  @return {*}
	  ###
	$[pluginName].fn.scroll = (options) ->
		_options = $.extend($[pluginName].fn.scroll.defaults, options)
		@each(->
		).click (e) ->
			e.preventDefault()
			_this = $(this)
			_href = _this.attr("href")

			# href属性があり、かつ1文字目が#（＝アンカー）であれば
			if _href isnt null and _href.charAt(0) is "#"
				$("html, body").animate
					scrollTop: $(_href).offset().top - 90
				, _options.duration, _options.easing
			return

		this


	###
	  スムーズスクロールのデフォルト設定
	  @type {Object}
	  ###
	$[pluginName].fn.scroll.defaults =
		duration: 400
		easing: "easeOutExpo"


	###
	  タブ作成
	  @param options
	  @return {*}
	  ###
	$[pluginName].fn.tab = (options) ->
		_options = $.extend($[pluginName].fn.tab.defaults, options)
		@each ->
			_this = $(this)
			_anchors = _this.find("a[href^=#]")
			_panels = $(_options.panelSelector)

			# ハッシュを取得
			_hash = window.location.hash

			# ハッシュがあれば該当のパネルを、なければ最初のパネルを取得
			_lastAnchor = (if ($(_hash)[0]) then _anchors.filter("a[href=" + _hash + "]") else $(_anchors[0]))
			_lastPanel = $(_lastAnchor.attr("href"))

			# 最初に表示するタブをアクティブにする
			_lastAnchor.addClass _options.activeTabClass

			# すべてのパネルを非表示
			_panels.hide()

			# 最初に表示するパネルを表示
			_lastPanel.show()
			_anchors.click (e) ->
				e.preventDefault()
				_currentAnchor = $(this)
				_currentPanel = $(_currentAnchor.attr("href"))
				_lastAnchor.removeClass _options.activeTabClass
				_currentAnchor.addClass _options.activeTabClass

				# 非アクティブに
				_lastTab = _lastAnchor.find("img")
				_lastSrcUp = _lastTab.attr("src")
				_lastSrcActive = _lastSrcUp.split("_on").join("")
				_preloadLast = new Image()
				_preloadLast.src = _lastSrcActive
				_lastTab.attr "src", _lastSrcActive

				# アクティブなパネルを非表示
				_lastPanel.hide()

				# 新しいパネルを表示
				_currentPanel.show()

				# タブの画像を差し替え
				_srcUp = _currentAnchor.find("img").attr("src")
				_srcActive = _srcUp.replace(/^(.+)(\.[^\.]+)$/, "$1" + "_on" + "$2")
				_preloadImg = new Image()
				_preloadImg.src = _srcActive
				_currentAnchor.find("img").attr "src", _srcActive
				_lastAnchor = _currentAnchor
				_lastPanel = _currentPanel
				return

			return

		this


	###
	  タブ作成のデフォルト設定
	  @type {Object}
	  ###
	$[pluginName].fn.tab.defaults =
		activeTabClass: "active"
		panelSelector: ".panel"


	###
	  プルダウン
	  @param options
	  @return {*}
	  ###
	$[pluginName].fn.pulldown = (options) ->
		_options = $.extend($[pluginName].fn.pulldown.defaults, options)
		@each ->
			_this = $(this)
			_subNav = _this.find("ul ul")
			_subNav.hide()
			_this.find("li").hover (->
				$(">ul:not(:animated)", this).slideDown _options.downDuration, _options.downEasing
				return
			), ->
				$(">ul", this).slideUp _options.upDuration, _options.upEasing
				return

			return

		this


	###
	  プルダウンのデフォルト設定
	  @type {Object}
	  ###
	$[pluginName].fn.pulldown.defaults =
		downDuration: 400
		downEasing: "easeOutExpo"
		upDuration: 200
		upEasing: "easeInExpo"

	return
) jQuery