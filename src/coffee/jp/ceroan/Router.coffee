class Router extends Kazitori
	@manager = null

	init: (manager) ->
		@manager = manager
		return

	routes :
		"": "index"
		"/": "index"

	index: () ->
		# 初期化前であれば何もしない
		if !StImage.utils.ItemListObject.isInit
			return
		# 検索中であれば何もしない
		if StImage.utils.ItemListObject.isUpdating
			return
		# URLパラメータの取得と保存
		_itemListScene = @manager.getSceneById("itemList")
		_itemListScene.getUrlParams()

		# pushStateによる遷移（戻る・進むボタン）。URLパラメータを取得し、それをもとに検索実行
		StImage.utils.ItemListObject.isPaging = true
		_itemListScene.updateItemsFromPushState()
