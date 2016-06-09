Logger = require("../debug/Logger")
SceneEvent = require("../events/SceneEvent")
Root = require("../Root")

module.exports = class SceneManager
#	コンストラクタ
	constructor: () ->
		Logger.log "SceneManager", Logger.LOG_VERBOSE
#		シーン一覧
		@scenes = []
#		現在のシーン
		@currentScene = null
		@departedSceneId = null
		@arrivedScene = null
		@arrivedSceneId = null
#		シーン移動中かどうか
		@isMoving = false

#	初期化
	init: (scene) ->
		Logger.log "SceneManagerを初期化 : #{scene.id}", Logger.LOG_VERBOSE
		@scenes.push scene
		@currentScene = scene
		@currentSceneId = scene.id
		@currentScene.dispatchEvent SceneEvent.SCENE_INIT

#	シーンの追加
	add: (scene) ->
		@scenes.push scene

#	シーンIDでシーンを取得
	getSceneById: (id) ->
		_scene = undefined
		$.each @scenes, () ->
			if id == this.id
				_scene = this
				return false
		return _scene

#	シーンの移動
	goto: (targetScene) ->
#		シーン移動中は何もしない
		if @isMoving
			Logger.log "シーン移動中です。", Logger.LOG_ERRORS
			return
#		シーンIDが同一の場合は何もしない
		if targetScene.id == @currentScene.id
			Logger.log "現在位置と目的位置のシーンIDが同一です。", Logger.LOG_ERRORS
			return
#		シーンIDが無い場合は何もしない
		if targetScene.id == undefined
			Logger.log "目的位置のシーンIDがundefinedです。", Logger.LOG_ERRORS
			return
		@isMoving = true
		@departedScene = @currentScene
		@departedSceneId = @currentScene.id
		@arrivedScene = targetScene
		@arrivedSceneId = targetScene.id
		@currentSceneId = this.departedSceneId
#		p.currentTargetId = (targetId === undefined) ? 1 : targetId;
#		現在位置のシーン、シーンIDを更新
		Logger.log "SceneManagerが移動開始 : #{@departedSceneId} -> #{@arrivedSceneId}", Logger.LOG_VERBOSE
		@currentScene.dispatchEvent SceneEvent.SCENE_DEPART
		_executor = @currentScene.executor
		if _executor
			_executor.addEventListener "exeComplete", () =>
				_gotoComplete.call @
			_executor.execute()
		else
			_gotoComplete.call @

	current: =>
		return @currentScene

	_gotoComplete = () ->
		@currentScene.dispatchEvent SceneEvent.SCENE_GOTO
		@isMoving = false
		@currentScene = @arrivedScene
		@currentScene.dispatchEvent SceneEvent.SCENE_ARRIVE
		# 到着直後に別のシーンに遷移することがあるため到着イベントは最後にトリガーする
#		Root.router.change("/" + @currentScene.id)
		_executor = @currentScene.executor
		if _executor
			_executor.addEventListener "exeComplete", () =>

			_executor.execute()
