// just a basic class to keep the graphics drawing stuff in one place

var g:h2d.Graphics; // cannot use dynamic vars here..?

// inheritance vs composite?
class Canvas {
	public function new() {
		g = new h2d.Graphics(s2d); // s2d is the "default" scene in the App class
	}

	public function paintLaser(x:Float, y:Float, x2:Float, y2:Float) {
		// lineStyle( size : Float = 0, color = 0, alpha = 1. ) {
		g.lineStyle(50, 0xFF00FF, .8);
		g.moveTo(x, y);
		g.lineTo(x2, y2);
		g.endFill();
	}

	// pretty useless...
	// it doesn't really have a way to rotate...
	// unless you rotate the entire canvas... lol
	public function paintRectangle(x:Float, y:Float, width:Float, height:Float, color:Int = 0xFFFFFF, alpha:Float = 1.0) {
		// g.clear();
		g.beginFill(color, alpha);
		g.drawRect(x, y, width, height);
		g.endFill();
	}
}
