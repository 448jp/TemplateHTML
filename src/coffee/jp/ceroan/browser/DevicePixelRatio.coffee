if !window.devicePixelRatio
	window.devicePixelRatio = () =>
		ratio = 1
		if window.screen.systemXDPI != undefined && window.screen.logicalXDPI != undefined && window.screen.systemXDPI < window.screen.logicalXDPI
			ratio = window.screen.systemXDPI / window.screen.logicalXDPI
		else
			ratio = undefined
		return ratio
