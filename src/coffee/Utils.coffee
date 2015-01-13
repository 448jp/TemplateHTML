class Utils
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