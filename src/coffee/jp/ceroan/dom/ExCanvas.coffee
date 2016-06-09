require("EaselJS")
CastEvent = require("../events/CastEvent")

module.exports = class ExCanvas

	constructor: (initObject) ->
		@stage = null

		_created = false
		_canvasId = initObject.canvasId
		_width = initObject.width

		if _canvasId && !_created
			@stage = new createjs.Stage _canvasId
			@canvas = @stage.canvas
			createjs.Ticker.setFPS initObject.fps
			createjs.Ticker.timingMode = createjs.Ticker.RAF_SYNCHED
			createjs.Touch.enable(@stage)
			@stage.enableMouseOver()

		_created = true

		_ready = () =>
			createjs.Ticker.on "tick", () =>
				_tickHandler.call @
			@atReady()

		window.ready = ( ->
			_ready()
		)()

	atReady: () =>


	_tickHandler = () ->
		@stage.update()
