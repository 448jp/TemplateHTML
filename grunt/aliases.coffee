module.exports =
	default: [
		"clean"
		"assemble"
		"sass:production_pc"
		"autoprefixer:production"
		"browserify:production_pc"
		"copy"
	]
	publish_pc: [
		"clean:production_pc"
		"assemble:quotesIndex"
		"assemble:quote"
		"assemble:dev_pc"
		"compass:production_pc"
		"browserify:dev_pc"
		"newer:imagemin:production_pc"
		"newer:tinypng:production_pc"
		"newer:copy:production_pc"
	]
	publish_sp: [
		"clean:production_sp"
		"assemble:dev_sp"
		"sass:production_sp"
		"coffee:dev_sp"
		"uglify:dev_sp"
		"newer:imagemin:production_sp"
		"newer:tinypng:production_sp"
		"newer:copy:production_sp"
	]
	publish_fp: [
		"clean:production_fp"
		"assemble:dev_fp"
		"utf8tosjis:dev_fp"
		"copy:production_fp"
	]
	watch_dev_pc: [
		"connect:dev_pc"
		"esteWatch"
	]
	watch_dev_sp: [
		"connect:dev_sp"
		"esteWatch"
	]
	watch_dev_fp: [
		"connect:dev_fp"
		"esteWatch"
	]
	watch_production_pc: [
		"connect:production_pc"
		"esteWatch"
	]
	watch_production_sp: [
		"connect:production_sp"
		"esteWatch"
	]
	watch_production_fp: [
		"connect:production_fp"
		"esteWatch"
	]
