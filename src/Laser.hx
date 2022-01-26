import h2d.Object;
import hxd.Math;
import hxd.Timer;

class Laser extends Object {
	var color:Int;

	public override function new(?parent:Object, x:Float, y:Float, rotation:Float, color:Int = 0xFFFFFF) {
		super(parent); // scene
		this.x = x; // starting point
		this.y = y;
		this.rotation = rotation; // needed to calculate end-point
		this.color = color;

		// Graphics implementation
		// currently draws using a global graphics class

		// bitmap implementation
		// bitmap = new Bitmap(Tile.fromColor(color));
	}

	// call me in main
	public function update() {
		// this.alpha -= .00001 * Math.dt;
	}

	// Object already has a draw function... soooooo:
	public function drawLaser() {
		trace("draw laser");

		// calculate end-point
		var angle = this.rotation;

		var d = HP.scene.width + HP.scene.height; // todo: lol
		var x2 = this.x + d * Math.cos(angle);
		var y2 = this.y + d * Math.sin(angle);

		// does it matter if the point is off the screen?
		// i mean, the engine only draws what's on screen, right..?

		var r:Float = Math.random(); // not sure where Int64.max is...	
		var r2:Int = Math.round(r); // not sure of the value of 0xFFFFFF anyway..

		// does haxe have (Int)float-number feature?
		// haxe.std not showing up in autocompletion...

		G.pen.lineStyle(50, r2, .8); 
		drawLine(this.x, this.y, x2, y2);
	}

	private function drawLine(x:Float, y:Float, x2:Float, y2:Float) {
		// lineStyle( size : Float = 0, color = 0, alpha = 1. ) {
		// G.pen.clear?
		G.pen.beginFill(this.color, .8); //or just linestyle?
		G.pen.moveTo(x, y);
		G.pen.lineTo(x2, y2);
		//G.pen.endFill(); // beginFill does this
		// G.pen.visible?
	}
}
