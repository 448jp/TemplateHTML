module.exports = class ArrayUtils
	constructor: () ->

	# 配列をシャッフルして返却します。
	@shuffle: (array) ->
		n = array.length

		while (n)
			i = Math.floor(Math.random() * n--)
			t = array[n]
			array[n] = array[i]
			array[i] = t

		return array
