# 正規表現でremoveClass
$.fn.extend
	removeClassRegEx: (options) ->
		self = $.fn.removeClassRegEx
		opts = $.extend {}, self.default_options, options
		$(this).each (i, el) ->
			self.init el, opts
			self.log el if opts.log

$.extend $.fn.removeClassRegEx,
	default_options:
		regex: null
		log: false

	init: (element, options) ->
		_classes = $(element).attr("class")
		if (!_classes || !options.regex)
			return false
		_classArray = []
		_classes = _classes.split(" ")
		for i in [0.._classes.length - 1]
			if (!_classes[i].match(options.regex))
				_classArray.push(_classes[i])
		$(element).attr("class", _classArray.join(" "))

	log: (msg) ->
		console.log msg