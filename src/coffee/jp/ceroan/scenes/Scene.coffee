require("EaselJS")
Root = require("../Root")
Logger = require("../debug/Logger")
SceneEvent = require("../events/SceneEvent")

module.exports = class Scene
	createjs.extend(Scene, createjs.EventDispatcher)
	createjs.promote(Scene, "EventDispatcher")

	constructor: (sceneId) ->
		@EventDispatcher_constructor()
		@id = sceneId
		@container = new createjs.Container()
		@executor = null
		@title = null
		this.on SceneEvent.SCENE_INIT, (event) ->
			@atSceneInit()
		this.on SceneEvent.SCENE_DEPART, (event) ->
			@atSceneDepart()
		this.on SceneEvent.SCENE_GOTO, (event) ->
			@atSceneGoto()
		this.on SceneEvent.SCENE_ARRIVE, (event) ->
			@atSceneArrive()
		return @

	addCommand: (command) =>
		@executor = command

	atSceneInit: () ->
		Logger.log "Sceneの初期化", Logger.LOG_VERBOSE
		Root.stage.addChild(@container)

	atSceneDepart: () ->
		Logger.log "Sceneの出発", Logger.LOG_VERBOSE

	atSceneGoto: () ->
		Logger.log "Sceneの移動", Logger.LOG_VERBOSE
		Root.stage.removeChild(@container)

	atSceneArrive: () ->
		Logger.log "Sceneの到着", Logger.LOG_VERBOSE
		Root.stage.addChild(@container)

	next: () =>
		_manager = Root.manager
		_scenes = _manager.scenes
		if _scenes.length <= 0
			return null
		_nextScene = null
		for i in [0.._scenes.length - 1]
			if _scenes[i].id == @id
				if i == _scenes.length - 1
					return null
				_nextScene = _scenes[i + 1]
		return _nextScene

	prev: () =>
		_manager = Root.manager
		_scenes = _manager.scenes
		if _scenes.length <= 0
			return null
		_prevScene = null
		for i in [0.._scenes.length - 1]
			if _scenes[i].id == @id
				if i <= 0
					return null
				_prevScene = _scenes[i - 1]
		return _prevScene
