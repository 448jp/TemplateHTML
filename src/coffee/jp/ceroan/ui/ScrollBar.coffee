require("EaselJS")
Event = require("../events/Event")
EventDispatcher = require("../events/EventDispatcher")

class ScrollBar extends EventDispatcher
	constructor: (stage) ->
		@stage = stage
		# スクロールエリア
		@base = null
		# スライダー
		@slider = null
		# スクロール対象コンテンツ
		@content = null
		# スクロール対象コンテンツが保持している、スクロールによって実際に変化させたいプロパティ名
		@key = null
		# スクロール対象コンテンツが保持している、スクロールによって実際に変化させたいプロパティ値
		@property = null
		# コンテンツ量に応じて伸縮するスライダーを使用する場合、スライダーの最小サイズをピクセル値で設定
		@minSliderHeight = 10
		# アローボタンを1回クリックしたときのスクロール量
		@arrowScrollAmount = 48
		# マウスホイールが有効化どうか
		@useMouseWheel = true
		# コンテンツ量に応じて伸縮するスライダーを使用するかどうかを設定します。
		@useFlexibleSlider = true
		# スライダーの高さを常に0として扱うかどうか
		@useIgnoreSliderHeight = false

	# スクロールエリアを設定
	setBase: (value) =>
		_bindBaseButton.call @, false
		@base = value
		_bindBaseButton.call @, true
		@resizeSlider()

	# スライダーを設定
	setSlider: (value) =>
		_bindSliderButton.call @, false
		@slider = value
		_bindSliderButton.call @, true
		@resizeSlider()

	# スクロール対象コンテンツの総計サイズを設定します。
	setContentSize: (value) =>
		@contentSize = value
		@resizeSlider()

	# スクロール対象コンテンツの表示部分のサイズを設定します。
	setMaskSize: (value) =>
		@maskSize = value
		@resizeSlider()

	# スライダーが下限に達したときの変化対象プロパティの値を設定
	setLowerBound: (value) =>
		@lowerBound = value
		@resizeSlider()

		# コンテンツの位置補正
		if ((@upperBound - @content[@key]) / (@upperBound - @lowerBound) > 1)
#			_terminateScrollFlag = true
			@targetScroll = @lowerBound
			@content[@key] = @lowerBound

	# コンテンツ量に応じて伸縮するスライダーを使用するかどうかを設定します。
	setUseFlexibleSlider: (value) =>
		@useFlexibleSlider = value
		@resizeSlider()

	# スライダーの高さを常に0として扱うかどうかを設定します。
	setUseIgnoreSliderHeight: (value) =>
		@useIgnoreSliderHeight = value
		@resizeSlider()

	# 初期化
	setup: (content, key, contentSize, maskSize, upperBound, lowerBound) =>
#		if _isReady
#			_stopUserActionScroll()
#			stopAutoScroll()
		@isReady = true

		@content = content
		@key = key
		@property = @content[@key]
		@contentSize = contentSize
		@maskSize = maskSize
		@upperBound = upperBound
		@lowerBound = lowerBound

		if !@ticker
			@ticker = new createjs.Shape()

#		//スクロール完了時に対象プロパティが到達する目標値を現在のプロパティ値に設定する
		@targetScroll = @property

#		//現在スクロールが進行中であるかどうかのフラグを初期化する
		@isScrolling = false

#		//オートスクロール中でない
#		_isAutoScrolling = false

#		//スライダーがユーザによって現在ドラッグされているかどうかのフラグを初期化する
		@isDragging = false

#		//ユーザのスライダードラッグ動作によるスクロールが現在進行中であるかどうかのフラグを初期化する
		@isScrollingByDrag = false

#		//ユーザの動作によるスクロールが現在進行中であるかどうかのフラグを初期化する
		@isScrollingByUser = false

#		//オーバーシュートしていない
		@isOvershooting = false

#		//前回のスクロール時から，開始イベントが発行されていない場合はfalse
		_isStartedScroll = false

#		//コンテンツサイズがマスクサイズ以下である場合はtrue
		@isUnderFlow = if (@contentSize <= @maskSize) then true else false

#		//スクロール実行メソッドの呼び出し振り分けフラグ
		_calledFromUpdateAutoScroll = false

#		//ボタンアクションをバインドする
#		_isUpPressed     = false;
#		_isDownPressed   = false;
		@isBasePressed   = false
		@isSliderPressed = false

		if @stage
#			_bindArrowUpButton(true)
#			_bindArrowDownButton(true)
			_bindBaseButton.call @, true
			_bindSliderButton.call @, true

#		//ボタンを有効化する
#		buttonEnabled = true

#		//スライダーのリサイズを実行する
		@resizeSlider()

	# 現在の対象コンテンツ総計サイズ、対象コンテンツ表示領域サイズ、スライダのベースエリアのサイズに合わせて、スライダーをリサイズする関数です。
	resizeSlider: () =>
		@isUnderFlow = if (@contentSize <= @maskSize) then true else false

		if (!@isReady || !@slider)
			return

#		//スライダーの高さ0として扱う
		if @useIgnoreSliderHeight
			@slider.scaleY = 1
			@sliderHeight = 0
			@updateSlider()
			return

#		//バーを伸縮させない場合
		if !@useFlexibleSlider
			@slider.scaleY = 1
			@sliderHeight = @slider.getBounds().height
			@updateSlider()
			return

		if (!@base)
			return

		_contentRatio = @maskSize / @contentSize

		# コンテンツサイズがマスクサイズに満たない場合
		if (@isUnderFlow)
			@slider.dispatchEvent(new Event("update", @slider, @base.getBounds().height))
			@sliderHeight = @base.getBounds().height
			@updateSlider()
			return

		_h = _contentRatio * @base.getBounds().height

		@sliderHeight = Math.round(if (_h < @minSliderHeight) then @minSliderHeight else _h)
		@slider.dispatchEvent(new Event("update", @slider, @sliderHeight))

#		//位置合わせをおこなう
		@updateSlider()

	# コンテンツのスクロール量に応じてスライダーの形状と位置を計算する関数です。
	updateSlider: () =>
#		if (!_slider || !_base || !_content) return;

		if (@contentSize <= @maskSize)
#			@slider.y = 0
#			@content[@key] = @upperBound
			return

		_contentRatio = (@upperBound - @content[@key]) / (@upperBound - @lowerBound)
		_h = if (@useIgnoreSliderHeight) then @base.getBounds().height else (@base.getBounds().height - @slider.getBounds().height)
		_p = _contentRatio * _h

#		//スライダーを変形させる
#		if (_useOvershoot && _useOvershootDeformationSlider && !_useIgnoreSliderHeight)
#			if (_useSmoothScroll)
#				_isOvershooting = false
#
#				//上側にオーバーシュートしている
#				if (contentRatio < 0)
#					_isOvershooting = true
#					_slider.height += ((_sliderHeight + _p) - _slider.height) / 3
#
#				//下側にオーバーシュートしている
#				if (contentRatio > 1)
#					_isOvershooting = true
#					_slider.height += ((_sliderHeight - _p + _h) - _slider.height) / 3
#
#				//オーバーシュートしていない
#				if (!_isOvershooting)
#					_slider.height += (_sliderHeight - _slider.height) / 10
#			else
#				_slider.height = _sliderHeight;
#
#			//座標の再計算
#			_h = _base.height - _slider.height
#			_p = contentRatio * _h

#			//ドラッグ中であればドラッグ可能領域を再計算する
#			if (@isDragging)
#				_bound = new createjs.Rectangle(_base.x, _base.y, 0, _h)
#				@slider.startDrag(false, _bound)
#				return
#
#			if (_isScrollingByDrag) return
#		else
		@isOvershooting = false

		# 上側にオーバーシュートしている
		if (_contentRatio < 0)
			@isOvershooting = true

		# 下側にオーバーシュートしている
		if (_contentRatio > 1)
			@isOvershooting = true

		if (@isDragging || @isScrollingByDrag)
			return

#		//スライダーの座標を補正する
		@slider.y = if (_p < 0) then 0 else if (_p > _h) then _h else _p

	# スクロールエリアの有効/無効を切り替えます。
	baseEnabled: (value) =>
		if @base
			@base.mouseEnabled = value

	# スライダーの有効/無効を切り替えます。
	sliderEnabled: (value) =>
		if (@slider)
			@slider.mouseEnabled = value

#			if (!value)
#				@slider.stopDrag()

	# スクロール位置を指定し、スクロールを実行する関数です。値の指定には割合（0〜1）を指定します。
	scrollByAbsoluteRatio: (ratio) =>
		if (!@isReady)
			return

		_pixel = (@lowerBound - @upperBound) * ratio + @upperBound
		@scrollByAbsolutePixel(_pixel)

	# 現在のプロパティ値からの相対的なスクロール量を、ピクセル数として指定してスクロールを実行する関数です。
	scrollByRelativePixel: (pixel, fromTargetPosition = true) =>
		if !@isReady
			return

		_o = if (fromTargetPosition) then @targetScroll else @property

		@scrollByAbsolutePixel(_o + pixel);

	# スクロール位置を指定し、スクロールを実行する関数です。値の指定にはピクセルを指定します。
	scrollByAbsolutePixel: (pixel) =>
		if (!@isReady)
			return

		@targetScroll = pixel

		@overShootTargetScroll = if (@targetScroll > @upperBound) then @upperBound else if (@targetScroll < @lowerBound) then @lowerBound else @targetScroll

#		if (_useOvershoot && _useSmoothScroll && !_calledFromUpdateAutoScroll) {
#			_targetScroll = (_targetScroll > @upperBound + _overshootPixels) ? @upperBound + _overshootPixels :
#							(_targetScroll < @lowerBound - _overshootPixels) ? @lowerBound - _overshootPixels :
#							 _targetScroll;
#		} else {
		@targetScroll = @overShootTargetScroll
#		}

#		//スクロールを開始する
		_startScroll.call @

	# 外部からスクロールを実行する関数です。
	scrollByExternal: (event) =>
		_mouseWheelHandler.call @, event

	# 外部（指）からスクロールを実行する関数です。
	scrollByFinger: (event) =>
		_panHandler.call @, event

	# スクロール処理を開始します。
	_startScroll = () ->
#		if (_usePixelFittingContent)
#			@targetScroll = Math.round(@targetScroll)

#		if (_useSmoothScroll)
#			//減速スクロールの開始
#			_prevProperty = NaN
#			_terminateScrollFlag = false
#			@ticker.addEventListener(Event.ENTER_FRAME, _updateScroll)
#		else
#			//ダイレクトスクロール
		if (@isScrolling)
			@ticker.removeEventListener(Event.ENTER_FRAME, _updateScroll)
		if (@isOvershooting)
			@targetScroll = @overShootTargetScroll
			@isOvershooting = false

#		if (@content[@key] != @targetScroll)
#			//スクロール開始イベント発行
#			dispatchEvent(new JPPScrollbarEvent(JPPScrollbarEvent.SCROLL_START))

#			//スクロール進捗イベント発行
#			dispatchEvent(new JPPScrollbarEvent(JPPScrollbarEvent.SCROLL_PROGRESS))

#			//スクロール完了イベント発行
#			dispatchEvent(new JPPScrollbarEvent(JPPScrollbarEvent.SCROLL_COMPLETE))

		@isScrolling = false
		@isScrollingByUser = false
		@isScrollingByDrag = false
		@content[@key] = @targetScroll
		@updateSlider()

	# スライダーのベースエリアのボタンアクションを設定します。
	_bindBaseButton = (bind) ->
		if (@base)
			if (bind)
				@base.off "mousedown", @baseMouseDownListener
				@baseMouseDownListener = @base.on "mousedown", (event) =>
					_baseButtonMouseDownHandler.call @, event
				if (@stage)
					@stage.off "stagemouseup", @stageMouseupListener
					@stageMouseupListener = @stage.on "stagemouseup", (event) =>
						_baseButtonMouseUpHandler.call @, event
				@baseEnabled(@isReady)
			else
				@base.off "mousedown", @baseMouseDownListener
				if (@stage)
					@stage.off "stagemouseup", @stageMouseupListener
				@baseEnabled(false)

	# スライダーのボタンアクションを設定します。
	_bindSliderButton = (bind) ->
		if (@slider)
			if (bind)
				@slider.off "mousedown", @sliderMouseDownListener
				@sliderMouseDownListener = @slider.on "mousedown", (event) =>
					_sliderButtonMouseDownHandler.call @, event
				if (@stage)
					@stage.off("stagemouseup", @stageMouseupListener)
					@stageMouseupListener = @stage.on "stagemouseup", (event) =>
						_sliderButtonMouseUpHandler.call @, event

				@sliderEnabled(@isReady)
			else
				@slider.off "mousedown", @sliderMouseDownListener
				if (@stage)
					@stage.off "stagemouseup", @stageMouseupListener

				@sliderEnabled(false)

	_baseButtonMouseDownHandler = (event) ->
		@isBasePressed = true
		if (!@isReady)
			return
		_pressBase.call @, event

	_baseButtonMouseUpHandler = (event) ->
		if (!@isBasePressed)
			return
		@isBasePressed = false

	# スライダーのベースエリアが押されたときに呼び出される関数です。
	# _baseButtonMouseDownHandlerイベントハンドラを通じて呼び出されます。
	_pressBase = (event) ->
#		//オートスクロールの中断
#		if (_useAutoScrollCancelable) stopAutoScroll();

		# ユーザーアクションによるスクロールであることを示す
		@isScrollingByUser = true

		# ドラッグ以外のスクロールであることを示す
		@isScrollingByDrag = false

		# マウス座標
		_point = @base.globalToLocal(@stage.mouseX, @stage.mouseY)
		_mousePosition = @base.scaleY * _point.y

		if (@slider && !@useIgnoreSliderHeight)
			if (_mousePosition < @slider.y + @slider.getBounds().height * 0.5)
				# スライダーよりも上を押下
				_ratio = _mousePosition / (@base.getBounds().height - @slider.getBounds().height)
			else
				# スライダーよりも下を押下
				_ratio = (_mousePosition - @slider.getBounds().height) / (@base.getBounds().height - @slider.getBounds().height)
		else
			# スライダーのサイズを無視
			_ratio = _mousePosition / (@base.getBounds().height - 1)

		# スクロール処理を実行する
		@scrollByAbsoluteRatio(_ratio)

	# スライダーが押されたときに呼び出される関数です。
	_sliderButtonMouseDownHandler = (event) ->
		@isSliderPressed = true
		if (!@isReady)
			return
		_pressSlider.call @

	# スライダーが離されたときに呼び出される関数です。
	_sliderButtonMouseUpHandler = (event) ->
		if (!@isSliderPressed)
			return
		@isSliderPressed = false
		if (!@isReady)
			return
		_releaseSlider.call @

	# スライダーが押されたときに呼び出される関数です。
	_pressSlider = () ->
		if (!@base)
			return

		# コンテンツサイズがマスクサイズに満たない場合
		if (@isUnderFlow)
			return

		#		//オートスクロールの中断
		#		if (_useAutoScrollCancelable)
		#			stopAutoScroll()

		# ユーザーアクションによるスクロールであることを示す
		@isScrollingByUser = true
		@isDragging = true

		@sliderDragStartY = @slider.y
		@sliderDragStartMouseY = @stage.mouseX

		@moveSliderListener = @stage.on "stagemousemove", (event) =>
			_moveSliderHandler.call @, event

	# スライダーのドラッグ時に呼び出されるイベントハンドラです。
	_moveSliderHandler = (event) ->
		@isScrollingByDrag = true

		# スライダーの移動
		@slider.y = @sliderDragStartY + @stage.mouseX - @sliderDragStartMouseY
		# スライダーの移動区域制限
		_boundHeight = if (@useIgnoreSliderHeight) then @base.getBounds().height else (@base.getBounds().height - @slider.getBounds().height)
		@slider.y = if (@slider.y < @base.y) then @base.y else if (@slider.y > _boundHeight) then _boundHeight else @slider.y

		# コンテンツのスクロール
		_h = if (@useIgnoreSliderHeight) then @base.getBounds().height else (@base.getBounds().height - @slider.getBounds().height)
		_ratio = @slider.y / _h

		@scrollByAbsoluteRatio(_ratio)

	# スライダーが離されたときに呼び出される関数です。
	_releaseSlider = () ->
		@isDragging = false

		@stage.off "stagemousemove", @moveSliderListener

	# マウスホイールの動作時に呼び出されるイベントハンドラです。
	_mouseWheelHandler = (event) ->
		if !@isReady || !@useMouseWheel || event.deltaY == 0
			return

		# 目標値が端に到達している状態での，さらに外側にスクロールしようとする動作を無効化する
#		if (!_useOvershoot)
#			if ( (_targetScroll == _upperBound && e.delta > 0) ||
#				(_targetScroll == _lowerBound && e.delta < 0) ) return;
#		}

		# オートスクロールの中断
#		if (_useAutoScrollCancelable) stopAutoScroll();

		# ユーザーアクションによるスクロールであることを示す
		@isScrollingByUser = true

		# ドラッグ以外のスクロールであることを示す
		@isScrollingByDrag = false

		if event.deltaY < 0 || event.detail < 0
			if @useArrowScrollUsingRatio
				@scrollByRelativeRatio(@arrowScrollAmount, true)
			else
				@scrollByRelativePixel(@arrowScrollAmount, true)
		else
			if @useArrowScrollUsingRatio
				@scrollByRelativeRatio(-@arrowScrollAmount, true)
			else
				@scrollByRelativePixel(-@arrowScrollAmount, true)

	# パン操作時に呼び出されるイベントハンドラです。
	_panHandler = (event) ->
		if !@isReady || !@useMouseWheel || event.deltaY == 0
			return

		# 目標値が端に到達している状態での，さらに外側にスクロールしようとする動作を無効化する
		#		if (!_useOvershoot)
		#			if ( (_targetScroll == _upperBound && e.delta > 0) ||
		#				(_targetScroll == _lowerBound && e.delta < 0) ) return;
		#		}

		# オートスクロールの中断
		#		if (_useAutoScrollCancelable) stopAutoScroll();

		# ユーザーアクションによるスクロールであることを示す
		@isScrollingByUser = true

		# ドラッグ以外のスクロールであることを示す
		@isScrollingByDrag = false

		if event.velocityX < 0
			if @useArrowScrollUsingRatio
				@scrollByRelativeRatio(-@arrowScrollAmount, true)
			else
				@scrollByRelativePixel(-@arrowScrollAmount, true)
		else
			if @useArrowScrollUsingRatio
				@scrollByRelativeRatio(@arrowScrollAmount, true)
			else
				@scrollByRelativePixel(@arrowScrollAmount, true)

module.exports = ScrollBar
