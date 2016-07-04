class MathUtils
	constructor: () ->


	@randomRange: (minNum, maxNum, args...) ->
		if (args[0] == 0)
			_randomNum = Math.random() * (maxNum - minNum) + minNum
		else
			_randomNum = Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum
		return _randomNum

#	数値を桁揃えして文字列で返却
	@digit: (num, digitNum) ->
		_string = num.toString()
		_digitCount = digitNum - num.toString().length
		if (_digitCount > 0)
			for i in [0.._digitCount - 1]
				_string = "0" + _string
		return _string

module.exports = MathUtils
