require("TweenJS")
Command = require("./Command")

module.exports = class DoTweenJS extends Command

	constructor: (tweenProvider) ->
		super()
		@_tweenProvider = tweenProvider
		@_tweenProvider.setPaused(true)

	_completeHandler: (tween) =>
		@_cancel()
		@notifyComplete()

	_cancel: () ->
		@_tween.pause(@_tween)


	getTween: () -> return @_tween
	setTween: (tween) -> @_tween = tween; @

	_executeFunction: (command) ->
		@_tween = @_tweenProvider
		@_tween.loop = false
		@_tween.call(@_completeHandler)
		@_tween.setPaused(false)

	_interruptFunction: (command) ->
		@_cancel()

	_destroyFunction: (command) ->
		@_cancel()
