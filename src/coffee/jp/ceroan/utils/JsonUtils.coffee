module.exports = class JsonUtils
	constructor: () ->


	###*
    * JSONをソートするための関数です。JSON.sort()の引数に渡して使います。例：json.sort(JsonUtils.sort_by("index", false, parseInt))
    * @param {Object} field ソートの基準にするプロパティ
    * @param {Boolean} reverse 昇順
    * @param {Function} primer 型
	###
	@sort_by: (field, reverse, primer) ->
		if (reverse)
			reverse = -1
		else
			reverse = 1
		return (a, b) ->
			a = a[field]
			b = b[field]
			if typeof(primer) != "undefined"
				a = primer(a)
				b = primer(b)
			if (a < b)
				return reverse * -1
			if (a > b)
				return reverse * 1
			return 0
