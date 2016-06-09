module.exports = class SceneEvent

	#	シーンの初期化
	@SCENE_INIT = "sceneInit"
	#	シーンの出発
	@SCENE_DEPART = "sceneDepart"
	#	シーンの移動
	@SCENE_GOTO = "sceneGoto"
	#	シーンの到着
	@SCENE_ARRIVE = "sceneArrive"

	constructor: () ->

