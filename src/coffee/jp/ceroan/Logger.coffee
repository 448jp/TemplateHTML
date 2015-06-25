Config = require("./Config")

module.exports = class Logger
#	すべてのログを出力
	@LOG_VERBOSE: 0
#	ログを出力しない
	@LOG_SILENT: 10
#	エラーの時だけログを出力
	@LOG_ERRORS: 4
#	ログレベル
	@logLevel: Logger.LOG_VERBOSE

	@log: (log, level = 0) ->
		if @logLevel <= level && Config.debugMode
			console.log("LOGGER " + log);

if !window.console
	window.console = {}
	window.console.log = (str) ->
		return str
