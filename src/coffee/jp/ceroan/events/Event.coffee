module.exports = class Event
	@COMPLETE = 'complete'
	@OPEN     = 'open'
	@CLOSE    = 'close'
	@ERROR    = 'error'
	@CANCEL   = 'cancel'
	@RESIZE   = 'resize'
	@INIT     = 'init'
	@CONNECT  = 'connect'
	@PROGRESS = 'progress'
	@ADDED    = 'added'
	@REMOVED  = 'removed'
	@SELECT   = 'select'
	@FOCUS    = 'focus'
	@RENDER   = 'render'

	constructor: (@type, @target, @extra) ->
