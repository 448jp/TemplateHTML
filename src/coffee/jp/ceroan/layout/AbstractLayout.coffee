module.exports = class AbstractLayout

	constructor: () ->

	getNextPoint: () =>

	applyLayout: (object) =>
		_pt = @.getNextPoint()
		object.x = _pt.x
		object.y = _pt.y
