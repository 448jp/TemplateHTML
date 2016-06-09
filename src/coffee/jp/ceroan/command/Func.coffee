Command = require("./Command")

module.exports = class Func extends Command

	constructor: (func = null, args = [], dispatcher = null, eventType = null) ->
		super()
		@_func = func
		@_args = args
		@_dispatcher = dispatcher
		@_eventType = eventType

	_completeHandler: (event) =>
		@notifyComplete()

	getFunction: () -> return @_func
	setFunction: (func) -> @_func = func; @

	getArguments: () -> return @_args
	setArguments: (args) -> @_args = args; @

	_executeFunction: (command) ->
		if @_dispatcher? && @_eventType?
			@_dispatcher.addEventListener(@_eventType, @_completeHandler)
			@_func?(@_args...)
		else
			@_func?(@_args...)
			@notifyComplete()

	_interruptFunction: (command) ->
		if @_dispatcher? && @_eventType?
			@_dispatcher.removeEventListener(@_eventType, @_completeHandler)

	_destroyFunction: (command) ->
		@_func = null
		@_args = null
		@_dispatcher = null
		@_eventType = null
