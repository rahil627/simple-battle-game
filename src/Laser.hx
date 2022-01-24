import h2d.Object;
import h2d.Graphic;
import hxd.Math;
import hxd.Timer;

var g:Graphic;

class Laser extends Object {

	public function new(?parent Object, x:Float, y:Float, r:Float, color:Int = 0xFFFFFF) {
    		this.super(parent);
		this.x = parent.x; // starting point
		this.y = parent.y;
		this.rotation = r; // needed to calculate end-point
		//bitmap = new Bitmap(Tile.fromColor(color));
	}
	
	// call me in main
	public function update() {
		//this.alpha -= .00001 * Math.dt;
	}
	
	// override for custom drawing stuff
	override draw() {
		// calculate end-point
		var angle = this.rotation;
		
		var d = s2d.width + s2d.height; // todo: lol
		var x2 = this.x + d * Math.cos(angle);
		var y2 = this.y + d * Math.sin(angle);
		
		// does it matter if the point is off the screen?
		// i mean, the engine only draws what's on screen, right..?
		
		drawLine(this.x, this.y, x2, y2);
	}
	
	private function drawLine(x:Float, y:Float, x2:Float, y2:Float) {
		//lineStyle( size : Float = 0, color = 0, alpha = 1. ) {
		g.lineStyle(50, 0xFF00FF, .8); // todo: set random color
		//g.clear?
		g.moveTo(x, y);
		g.lineTo(x2, y2);
   		g.endFill();
		//g.visible?
	}


}