require("EaselJS")
CastEvent = require("../events/CastEvent")
SceneManager = require("../scenes/SceneManager")
Root = require("../Root")

module.exports = class ExDocument
	createjs.extend(ExDocument, createjs.Container)
	createjs.promote(ExDocument, "Container")

	constructor: (root, rootScene) ->
		@Container_constructor()
		Root.init(root, new SceneManager(rootScene))
