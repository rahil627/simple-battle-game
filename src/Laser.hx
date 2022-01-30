import h2d.Object;
import hxd.Math;
import hxd.Timer;
import h2d.Graphics;
import h2d.col.Bounds;

// i chose to extend graphics because i want to check for collisions
// and Object should have bounds..
// but it's stupid design, should just draw with a single graphics object
// and just use a struct to store laser data: points, color, etc.
// but, you know, this is good for the purpose to learn the heaps engine
class Laser extends Graphics {
	var laserColor:Int;

	public override function new(parent:Object, x:Float, y:Float, rotation:Float, color:Int = 0xFFFFFF) {
		super(parent);
		this.x = x; // starting point
		this.y = y;
		this.rotation = rotation; // needed to calculate end-point
		laserColor = color;

		// Graphics implementation
		// currently draws using a global graphics class
		drawLaser(); // TODO: draw here vs in main?

		// TODO: testing bounds
		var b:Bounds = new Bounds();
		this.getBounds(this, b); //TODO: relative to..? this or parent
		HP.console.log("getBounds " + b.toString());
		
		this.getBoundsRec(this, b, true); 
		HP.console.log("getBoundsRec " + b.toString());	

		this.getBoundsRec(this, b, false); 
		HP.console.log("getBoundsRec2 " + b.toString());
		
		// bitmap implementation
		// bitmap = new Bitmap(Tile.fromColor(color));
	}

	// call me in main
	public function update() {
		//this.alpha -= HP.dt / 10;
		
	}

	// Object already has a draw function... soooooo:
	// TODO: maybe should keep all draw functions seperate from logic
	// that way, can just call all the draw functions at once
	public function drawLaser() {
		// calculate end-point
		var angle = this.rotation;

		var d = HP.scene.width + HP.scene.height; // TODO: ? lol
		var x2 = this.x + d * Math.cos(angle);
		var y2 = this.y + d * Math.sin(angle);

		// does it matter if the point is off the screen?
		// i mean, the engine only draws what's on screen, right..?

		var r:Float = Math.random() * 0xFFFFFF; // not sure where Int.max is...	
		var r2:Int = Math.round(r); // not sure what the value of 0xFFFFFF is anyway.. 16^6..?

		// TODO: does haxe have (Int)float-number feature?
		// TODO: haxe.std not showing up in autocompletion...

		//

		//G.pen.clear()?
		this.lineStyle(50, r2, .8); 
		drawLine(this.x, this.y, x2, y2);
	}

	// maybe can add extension method to Graphics?..
	// if not, just those that shit into ra.Heaps
	private function drawLine(x:Float, y:Float, x2:Float, y2:Float) {
		//this.lineStyle(50, r2, .8); 
		this.moveTo(x, y);
		this.lineTo(x2, y2);
	}
}
