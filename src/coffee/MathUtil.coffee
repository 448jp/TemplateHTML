class MathUtil
	@randomRange: (minNum, maxNum, args...) ->
		if (args[0] == 0)
			_randomNum = Math.random() * (maxNum - minNum) + minNum
		else
			_randomNum = Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum
		return _randomNum