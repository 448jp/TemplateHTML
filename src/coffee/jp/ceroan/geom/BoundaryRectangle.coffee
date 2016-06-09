require("EaselJS")

class BoundaryRectangle
	# リサイズ方法
	@EXACT_FIT = "exactFit"
	@SHOW_ALL  = "showAll"
	@NO_BORDER = "noBorder"
	@NO_SCALE  = "noScale"

	# リサイズ後のオブジェクトの基準点
	@TOP_LEFT     = "TL"
	@TOP          = "T"
	@TOP_RIGHT    = "TR"
	@LEFT         = "L"
	@CENTER       = ""
	@RIGHT        = "R"
	@BOTTOM_LEFT  = "BL"
	@BOTTOM       = "B"
	@BOTTOM_RIGHT = "BR"

	constructor: () ->


	# targetをboundaryに合わせてリサイズした矩形を返します。リサイズ方法と基準点をscaleMode, alignで指定できます。
	#
	# @param [Rectangle] リサイズ対象の矩形を指定します。
	# @param [Rectangle] リサイズの基準となる矩形を指定します。
	# @param [String] リサイズ時のスケールモードを指定します。
	# @param [String] boundaryに対するtargetの基準位置を指定します。
	# @return リサイズ後の矩形が返されます。targetおよびboundaryは変更しません。
	#
	@resize: (target, boundary, scaleMode = "noScale", align = "") =>
		tx = target.x
		ty = target.y
		tw = target.width
		th = target.height
		bx = boundary.x
		_by = boundary.y
		bw = boundary.width
		bh = boundary.height

		switch scaleMode
			when @SHOW_ALL, @NO_BORDER
				ratioW = bw / tw
				ratioH = bh / th
				if (scaleMode == @SHOW_ALL)
					if (ratioW < ratioH)
						ratio = ratioW
					else
						ratio = ratioH
				else
					if (ratioW > ratioH)
						ratio = ratioW
					else
						ratio = ratioH
				tw *= ratio
				th *= ratio
				break
			when @EXACT_FIT
				return new createjs.Rectangle(bx, _by, bw, bh)

		if (align == @TOP_LEFT || align == @LEFT || align == @BOTTOM_LEFT)
			tx = bx
		else
			if (align == @TOP_RIGHT || align == @RIGHT || align == @BOTTOM_RIGHT)
				tx = bx + (bw - tw)
			else
				tx = bx + (bw - tw) / 2
		if (align == @TOP_LEFT || align == @TOP || align == @TOP_RIGHT)
			ty = _by
		else
			if (align == @BOTTOM_LEFT || align == @BOTTOM || align == @BOTTOM_RIGHT)
				ty = _by + (bh - th)
			else
				ty = _by + (bh - th) / 2

		return new createjs.Rectangle(tx, ty, tw, th)

module.exports = BoundaryRectangle
