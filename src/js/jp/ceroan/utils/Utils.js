export default class Utils {
	/**
	 * モバイルデバイスかどうかを返します。
	 * @returns {boolean}
	 */
	static detectMobile() {
		const ua = navigator.userAgent.toLowerCase();
		const mobileUa = ["android", "ipod", "iphone", "ipad"];
		let isMobile = false;
		for (let i = 0; i <= mobileUa.length - 1; i++) {
			if (ua.indexOf(mobileUa[i]) !== -1) {
				isMobile = true;
			}
		}
		return isMobile;
	}

	/**
	 * Androidかどうかを返します。
	 * @returns {boolean}
	 */
	static detectAndroid() {
		const ua = navigator.userAgent.toLowerCase();
		let isAndroid = false;
		if (ua.indexOf("android") !== -1) {
			isAndroid = true;
		}
		return isAndroid;
	}
}
