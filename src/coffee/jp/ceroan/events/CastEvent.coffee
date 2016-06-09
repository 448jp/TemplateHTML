class CastEvent

	# キャストの読み込み開始
	@CAST_LOAD_START = "castLoadStart"
	# キャストの読み込み中
	@CAST_LOAD_PROGRESS = "castLoadProgress"
	# キャストの読み込み完了
	@CAST_LOAD_COMPLETE = "castLoadComplete"

	constructor: () ->

module.exports = CastEvent
