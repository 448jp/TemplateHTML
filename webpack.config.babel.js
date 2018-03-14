const path = require("path");
const webpack = require("webpack");
const config = require("./gulp/config.js").config;

module.exports = {
	mode: config.isProduction ? "production" : "development",
	entry: `./${config.jsSourceDir}${config.jsSourcePath}${config.jsFilename}`,
	output: {
		path: path.join(__dirname, config.jsDir),
		filename: "app.js"
	},
	module: {
		rules: [
			{
				test: /\.js$/,
				exclude: /(node_modules|bower_components)/,
				use: {
					loader: "babel-loader",
					options: {
						presets: ["env"],
						plugins: [
							require("babel-plugin-transform-class-properties")
						]
					}
				}
			},
			{
				test: /\.vue/,
				exclude: /(node_modules|bower_components)/,
				use: {
					loader: "vue-loader",
					options: {
						transformToRequire: {
							source: "srcset"
						}
					}
				}
			},
			{
				test: /\.(png|jpg|gif)$/,
				use: {
					loader: "file-loader",
					options: {
						publicPath: "img/pages/home/",
						name: "[name].[ext]"
					}
				}
			}
		]
	},
	resolve: {
		extensions: [".js", ".vue"],
		alias: {
			vue$: "vue/dist/vue.esm.js",
			picturefill: path.resolve(
				"node_modules",
				"picturefill/dist/picturefill.min.js"
			),
			imagesloaded: path.resolve(
				"node_modules",
				"imagesloaded/imagesloaded.pkgd.min.js"
			),
			jquery: path.resolve("node_modules", "jquery/dist/jquery.min.js"),
			TweenLite: path.resolve(
				"node_modules",
				"gsap/src/minified/TweenLite.min.js"
			),
			TweenMax: path.resolve(
				"node_modules",
				"gsap/src/minified/TweenMax.min.js"
			),
			TimelineLite: path.resolve(
				"node_modules",
				"gsap/src/minified/TimelineLite.min.js"
			),
			TimelineMax: path.resolve(
				"node_modules",
				"gsap/src/minified/TimelineMax.min.js"
			),
			ScrollToPlugin: path.resolve(
				"node_modules",
				"gsap/src/minified/plugins/ScrollToPlugin.min.js"
			),
			"progressbar.js": path.resolve(
				"node_modules",
				"progressbar.js/dist/progressbar.min.js"
			),
			ScrollMagic: path.resolve(
				"node_modules",
				"scrollmagic/scrollmagic/minified/ScrollMagic.min.js"
			),
			"animation.gsap": path.resolve(
				"node_modules",
				"scrollmagic/scrollmagic/minified/plugins/animation.gsap.min.js"
			),
			"debug.addIndicators": path.resolve(
				"node_modules",
				"scrollmagic/scrollmagic/minified/plugins/debug.addIndicators.min.js"
			),
			"slick-carousel": path.resolve(
				"node_modules",
				"slick-carousel/slick/slick.min.js"
			),
			featherlight: path.resolve(
				"node_modules",
				"featherlight/release/featherlight.min.js"
			),
			"chart.js": path.resolve(
				"node_modules",
				"chart.js/dist/Chart.min.js"
			)
		}
	},
	plugins: config.isProduction
		? [
				new webpack.DefinePlugin({
					"process.env": {
						NODE_ENV: "'production'"
					}
				})
		  ]
		: [],
	cache: true
};
