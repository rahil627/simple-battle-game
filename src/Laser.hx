import h2d.Object;
import hxd.Math;
import hxd.Timer;
import h2d.Graphics;
import h2d.col.Bounds;
import hxd.poly2tri.Point;

// i chose to extend graphics because i want to check for collisions
// and Object should have bounds..
// but it's stupid design, should just draw with a single graphics object
// and just use a struct to store laser data: points, color, etc.
// but, you know, this is good for the purpose to learn the heaps engine
class Laser extends Graphics {
	var laserColor:Int;
	var lifeSpan:Float = 5.0;
	var angle:Float; // leave Object.angle alone!

	public override function new(parent:Object, x:Float, y:Float, angle:Float, color:Int = 0xFFFFFF) {
		super(parent);
		this.x = x; // TODO: using this as starting point, maybe not good idea...
		this.y = y; // can maybe get Bounds center
		this.angle = angle; // needed to calculate end-point
		laserColor = color;

		// calculate screen intersection
		var d = HP.scene.width + HP.scene.height; // TODO: ? lol
		var p = getEndPoint(this.x, this.y, angle, d);
		// TODO:  does it matter if the point is off the screen?
		// i mean, the engine only draws what's on screen, right..?

		var rc = ra.Haxe.getRandomColor(); 
		
		// TODO: testing bounds, compare with the bounds i calculate
		// i think they are used to calculate the bounds of all children, heavy stuff
		// results: it works, maybe just slightly off, and maybe different coordinate system
		var b = new Bounds(); // no constructor!

		HP.console.log("bounds BEFORE draw");	

		b.set(x, y, p.x, p.y); 
		HP.console.log("my bounds " + b.toString());

		this.getBounds(this, b); //TODO: relative to..? this or parent
		HP.console.log("getBounds " + b.toString());
		
		this.getBoundsRec(this, b, true); 
		HP.console.log("getBoundsRec " + b.toString());	

		this.getBoundsRec(this, b, false); 
		HP.console.log("getBoundsRec2 " + b.toString());
		
		// Graphics implementation
		drawLaser(x,y, p.x, p.y, 50, rc, .8); // TODO: draw here vs in main?

		HP.console.log("bounds AFTER draw");	
		
		b.set(x, y, p.x, p.y); 
		HP.console.log("my bounds " + b.toString());

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
	public function update(dt:Float) {
		//this.alpha -= HP.dt / 10;
		lifeSpan -= dt;	
		if (lifeSpan <= 0)
			this.remove();
	}

	// Object already has a draw function... soooooo:
	// TODO: maybe should keep all draw functions seperate from logic
	// that way, can just call all the draw functions at once
	public function drawLaser(x:Float, y:Float, x2:Float, y2:Float, width:Int = 10, ?color:Int = 0xFFFFF, alpha:Float = 1.0) {
		//G.pen.clear()?
		this.lineStyle(width, color, alpha); 
		drawLine(this.x, this.y, x2, y2);
	}

	// TODO: maybe can add extension method to Graphics?..
	// if not, just those that shit into ra.Heaps
	private function drawLine(x:Float, y:Float, x2:Float, y2:Float) {
		//this.lineStyle(50, r2, .8); 
		this.moveTo(x, y);
		this.lineTo(x2, y2);
	}

	// TODO: surely there are some simple stuff like this somewhere..
	// note: structs are useful for returning multiple data fields,
	// but should avoid passing them in, to keep the function more flexible 'n simple
	private function getEndPoint(startingX:Float, startingY:Float, angle:Float, distance:Float):Point {	
		var x2 = x + distance * Math.cos(angle);
		var y2 = y + distance * Math.sin(angle);
		return new Point(x2, y2);
	}
}
