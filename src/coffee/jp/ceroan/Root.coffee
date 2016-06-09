module.exports = class Root
	constructor: () ->
		@router = null
		@main = null

	@init: (root, manager) =>
		@stage = root.stage
		@canvas = root.canvas
		@manager = manager

	@setEventManager: (eventManager) =>
		@eventManager = eventManager

	@setPreloader: (preloader) =>
		@preloader = preloader

	@setRouter: (router) =>
		@router = router
