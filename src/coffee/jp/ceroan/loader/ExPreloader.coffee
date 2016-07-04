require("PreloadJS")
EventDispatcher = require("../events/EventDispatcher")
Event = require("../events/Event")

class ExPreloader extends EventDispatcher

	constructor: (manifest) ->
		super()
		@manifest = manifest
		@loader = new createjs.LoadQueue(false)
		@loader.on "loadstart", @atCastLoadStart
		@loader.on "progress", @atCastLoadProgress
		@loader.on "complete", @atCastLoadComplete
		@loader.setMaxConnections(6)

	load: () =>
		@loader.loadManifest @manifest

	_complete = () ->
		@atCastLoadComplete()
		@dispatchEvent Event.COMPLETE

	atCastLoadStart: () =>
		@dispatchEvent Event.START

	atCastLoadProgress: (event) =>
		@dispatchEvent Event.PROGRESS, event

	atCastLoadComplete: () =>
		@dispatchEvent Event.COMPLETE

module.exports = ExPreloader
