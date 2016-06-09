require("EaselJS")
require("PreloadJS")
CastEvent = require("../events/CastEvent")

module.exports = class ExPreloader
	createjs.extend(ExPreloader, createjs.Container)
	createjs.promote(ExPreloader, "Container")

	constructor: (manifest) ->
		@Container_constructor()
		@manifest = manifest
		@loader = new createjs.LoadQueue(true)
		@loader.on "loadstart", @atCastLoadStart
		@loader.on "complete", () =>
			_complete.call @

	load: () =>
		@loader.loadManifest @manifest

	_complete = () ->
		@atCastLoadComplete()
		@.dispatchEvent CastEvent.CAST_LOAD_COMPLETE

	atCastLoadStart: () =>


	atCastLoadComplete: () =>
		
