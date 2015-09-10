module.exports = class ImageLoader
	constructor: () ->
		return

	load: (images, progressCallback) ->
		_total = images.length
		$(images).each() ->
			$("<img/>")
			.attr("src", this)
			.load() ->
				progressCallback(_total, _total - images.length)
		return
