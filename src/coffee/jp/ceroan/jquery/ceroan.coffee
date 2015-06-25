require("jquery")
require("velocity")

module.exports = class Ceroan

	@this = null

	do (jQuery) ->
		$ = jQuery

		$.fn.ceroan = (name, options) ->
			switch name
				when "scroll"
					$.fn.ceroan.scroll(this, options)
				when "tab"
					$.fn.ceroan.tab(this, options)
			return this

		# スムーズスクロール
		$.fn.ceroan.scroll = (_this, options) =>
			_options = $.extend({}, $.fn.ceroan.scroll.defaults, options)
			return _this.each ->
				$(this).click (event) ->
					event.preventDefault()
					_this = $(this)
					_href = _this.attr("href")

					# href属性があり、かつ1文字目が#（＝アンカー）であれば
					if _href isnt null and _href.charAt(0) is "#"
						$(_href).velocity "scroll",
							duration: _options.duration
							easing: _options.easing
					return

		$.fn.ceroan.scroll.defaults =
			duration: 400
			easing: "easeOutExpo"

		# タブ
		$.fn.ceroan.tab = (_this, options) =>
			_options = $.extend({}, $.fn.ceroan.tab.defaults, options)
			return _this.each ->
				_this = $(this)
				_tabs = $(_options.tabSelector)
				_anchors = _tabs.find("a[href^=#]")
				_panels = $(_options.panelSelector)

				# ハッシュを取得
				_hash = window.location.hash

				# 最初のパネルを取得
				_lastAnchor = $(_anchors[0])
				_lastTab = _this.find(_options.tabSelector)
				_lastPanel = $(_lastAnchor.attr("href"))

				# 最初に表示するタブをアクティブにする
#				$(_lastTab[0]).addClass _options.activeTabClass

				# すべてのパネルを非表示
				_panels.hide()

				# 最初に表示するパネルを表示
				_lastPanel.show()
				_anchors.click (event) ->
					event.preventDefault()
					_currentAnchor = $(this)
					_currentPanel = $(_currentAnchor.attr("href"))
					_tabs.removeClass _options.activeTabClass
					$(_currentAnchor.parent().parent().get(0)).addClass _options.activeTabClass

					# アクティブなパネルを非表示
					_lastPanel.hide()
					# 新しいパネルを表示
					_currentPanel.show()

					_lastPanel = _currentPanel
					_options.onChange(event)
					return

		$.fn.ceroan.tab.defaults =
			tabSelector: ".tab"
			activeTabClass: "active"
			panelSelector: ".panel"
			onChange: () ->
				return