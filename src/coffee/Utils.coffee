class Utils
	constructor: () ->
		return

	@getUrlParams: () ->
		pl     = /\+/g
		search = /([^&=]+)=?([^&]*)/g
		decode = (s) ->
			return decodeURIComponent(s.replace(pl, " "))
		query  = window.location.search.substring(1)

		urlParams = {}
		while (match = search.exec(query))
			urlParams[decode(match[1])] = decode(match[2])
		return urlParams