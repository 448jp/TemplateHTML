class Utils
	@isWebKit = navigator.userAgent.indexOf('WebKit') != -1

	constructor: () ->
		return

	@detectMobile: () ->
		_ua = navigator.userAgent.toLowerCase()
		_mobileUa = ["android", "ipod", "iphone", "ipad"]
		_isMobile = false
		for i in [0.._mobileUa.length - 1]
			if _ua.indexOf(_mobileUa[i]) != -1
				_isMobile = true
		return _isMobile

	@detectIOs: () ->
		@detectIOs()
		_ua = navigator.userAgent.toLowerCase()
		_isIOs = false
		if _ua.indexOf("ipod") != -1 || _ua.indexOf("iphone") != -1 || _ua.indexOf("ipad") != -1
			_isIOs = true
		return _isIOs

	@detectAndroid2: () ->
		_ua = navigator.userAgent.toLowerCase()
		_match = _ua.match(/android\s+([.0-9]+)/)
		if _match && _match[1].match(/^2\./)
			return true
		return false


	@computeDuration: (ms) ->
		h = String(Math.floor(ms / 3600000) + 100).substring(1)
		m = String(Math.floor((ms - h * 3600000)/60000)+ 100).substring(1)
		s = String(Math.round((ms - h * 3600000 - m * 60000)/1000)+ 100).substring(1)
		return h + ":" + m + ":" + s

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

module.exports = Utils