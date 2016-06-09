require("EaselJS")
AbstractLayout = require("./AbstractLayout")

class ShapeLayout extends AbstractLayout

	constructor: (target) ->
		@target = target
		# 比較するシェイプ
		@rect = {
			x: @target.getBounds().x
			y: @target.getBounds().y
			width: @target.getBounds().width
			height: @target.getBounds().height
		}
		@scale = 1
		@objects = []

	getNextPoint: () =>
		loop
			@pt = new createjs.Point()
			@pt.x = (Math.random() * @rect.width)
			@pt.y = (Math.random() * @rect.height)

			if !@target.hitTest(@pt.x, @pt.y)
				@pt = null
			break if @pt != null
		return @pt

	applyLayout: (object, collision = true) =>
		_pt = @.getNextPoint()
		object.x = _pt.x + @rect.x
		object.y = _pt.y + @rect.y
		object.visible = true

		if collision
			_bounds = object.getBounds()
			object.setBounds(object.x, object.y, _bounds.width, _bounds.height)
			@objects.push(object)
			@checkLayout(object)

	checkLayout: (object) =>
		for i in [0..@objects.length - 1]
			if @objects.length == 0
				break
			if i == @objects.length - 1
				break
			if @checkIntersection(@objects[i], @objects[@objects.length - 1])
				_currentObject = @objects[@objects.length - 1]
				_bounds = _currentObject.getBounds()
				@getNextPoint()
				_currentObject.x = (@pt.x + @rect.x) * @scale
				_currentObject.y = (@pt.y + @rect.y) * @scale
				_currentObject.setBounds(_currentObject.x, _currentObject.y, _bounds.width, _bounds.height)
				@checkCount += 1
				if @checkCount >= 30
					_currentObject.x = 0
					_currentObject.y = 0
					_currentObject.visible = false
					_currentObject.setBounds(0, 0, _bounds.width, _bounds.height)
					break
				@checkLayout(_currentObject)

	# 2つのRectangleが被っているかどうかを判定します。
	checkIntersection: (rect1, rect2) =>
		_rect1Bounds = rect1.getBounds()
		_rect2Bounds = rect2.getBounds()
		if _rect1Bounds.x * @scale >= _rect2Bounds.x * @scale + _rect2Bounds.width || _rect1Bounds.x * @scale + _rect1Bounds.width <= _rect2Bounds.x * @scale || _rect1Bounds.y * @scale >= _rect2Bounds.y * @scale + _rect2Bounds.height || _rect1Bounds.y * @scale + _rect1Bounds.height <= _rect2Bounds.y * @scale
			return false
		return true

module.exports = ShapeLayout
