import $ from "jquery";
import TweenMax from "TweenMax";
import "ScrollToPlugin";
$.fn.ceroan = function(name, options) {
	switch (name) {
		case "scroll":
			$.fn.ceroan.scroll(this, options);
	}
	return this;
};
/**
 * スムーズスクロールを設定します。
 * @param _this 対象のjQueryオブジェクト
 * @param _options オプション
 */
$.fn.ceroan.scroll = (_this, _options) => {
	const options = $.extend({}, $.fn.ceroan.scroll.defaults, _options);
	return _this.each(function() {
		$(this).on("click", event => {
			event.preventDefault();
			const $this = $(this);
			// オプションにdata属性の指定があれば
			if (options.data) {
				// data属性の値をidとしてスムーズスクロール
				const id = $this.data(options.data);
				TweenMax.to(window, options.duration, {
					ease: options.ease,
					scrollTo: `#${id}`
				});
				return;
			}
			const href = $this.attr("href");
			// href属性があり、かつ1文字目が#（＝アンカー）であれば
			if (href !== null && href.charAt(0) === "#") {
				$(href).velocity("scroll", {
					duration: options.duration,
					easing: options.easing,
					offset: options.offset
				});
			}
		});
	});
};
$.fn.ceroan.scroll.defaults = {
	duration: 0.4,
	ease: Power2.easeInOut,
	offset: 0,
	data: null
};
