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

	/**
	 * iOSかどうかを返します。
	 * @returns {boolean}
	 */
	static detectIOs() {
		const ua = navigator.userAgent.toLowerCase();
		let isIOs = false;
		if (
			ua.indexOf("ipod") != -1 ||
			ua.indexOf("iphone") != -1 ||
			ua.indexOf("ipad") != -1
		) {
			isIOs = true;
		}
		return isIOs;
	}

	/**
	 * iOSのメジャーバージョンを返します。
	 * @returns {Number}
	 */
	static detectIOsMajorVersion() {
		let v, versions;

		// iOS以外であればundefinedを返す
		if (!this.detectIOs()) {
			return versions;
		}

		v = navigator.appVersion.match(/OS (\d+)_(\d+)_?(\d+)?/);
		versions = [
			parseInt(v[1], 10),
			parseInt(v[2], 10),
			parseInt(v[3] || 0, 10)
		];
		return versions[0];
	}
}
