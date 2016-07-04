class Event
	@START    = "start"
	@PROGRESS = "progress"
	@COMPLETE = "complete"
	@OPEN     = "open"
	@CLOSE    = "close"
	@ERROR    = "error"
	@CANCEL   = "cancel"
	@RESIZE   = "resize"
	@INIT     = "init"
	@CONNECT  = "connect"
	@ADDED    = "added"
	@REMOVED  = "removed"
	@SELECT   = "select"
	@FOCUS    = "focus"
	@RENDER   = "render"

	constructor: (@type, @target, @extra) ->


module.exports = Event
