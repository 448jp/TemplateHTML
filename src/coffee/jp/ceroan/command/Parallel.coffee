Event = require("../events/Event")
CommandList = require("./CommandList")
CommandState = require("./CommandState")

module.exports = class Parallel extends CommandList

	constructor: (commands...) ->
		super(commands...)
		@_completeCount = 0

	addCommand: (commands...) ->
		super(commands...)
		@

	insertCommand: (commands...) ->
		super(@getLength(), commands...)
		@

	_completeHandler: (event) =>
		@notifyComplete() if ++@_completeCount >= @getLength()

	notifyComplete: () ->
		@.dispatchEvent("exeComplete")

	notifyBreak: () ->
		for c in @getCommands()
			if c.getState() == CommandState.EXECUTING
				c.removeEventListener(Event.COMPLETE, @_completeHandler)
				c.interrupt()
		@notifyComplete()

	notifyReturn: () ->
		for c in @getCommands()
			if c.getState() == CommandState.EXECUTING
				c.removeEventListener(Event.COMPLETE, @_completeHandler)
				c.interrupt()
		@getParent()?.notifyReturn()
		@destroy()

	getCompleteCount: () -> return @_completeCount

	_executeFunction: (command) ->
		if @getLength() > 0
			@_completeCount = 0
			for c in @getCommands()
				c.addEventListener(Event.COMPLETE, @_completeHandler)
				c.execute()
		else
			@notifyComplete()

	_interruptFunction: (command) ->
		for c in @getCommands()
			c.removeEventListener(Event.COMPLETE, @_completeHandler)
			c.interrupt()
		super(command)

	_destroyFunction: (command) ->
		for c in @getCommands()
			c.removeEventListener(Event.COMPLETE, @_completeHandler)
			c.destroy()
		@_completeCount = 0
		super(command)
