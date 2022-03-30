import h2d.Object;
import hxd.Math;
import hxd.Timer;
import h2d.Graphics;
import h2d.col.Bounds;
import h2d.col.Point;

// i chose to extend graphics because i want to check for collisions
// and Object should have bounds..
// but it's stupid design, should just draw with a single graphics object
// and just use a struct to store laser data: points, color, etc.
// but, you know, using Object is good for the purpose to learn the heaps engine
class Laser extends Entity {
	
	var laserColor:Int;
	var lifeSpan:Float = 5.0;
	var angle:Float; // leave Object.angle alone!
	var startingPoint:Point;
	var endingPoint:Point;
	
	var sprite:Graphics;
	// playerId:Int; // todo

	public override function new(x:Float, y:Float, r:Float, color:Int = 0xFFFFFF) {
		super();
		sprite = new Graphics(); // don't use constructor parameter parent, use scene.add for Layers
		sprite.x = x;
		sprite.y = y;
		//sprite.rotation = r; // TODO: rotate after drawing?
		laserColor = color;

		// lol, it would have been much much easier to draw a straight line, then
		// set the rotation to the player

		var rc = ra.Haxe.randomHex();
		drawLaser(0, 0, 0, HP.width, GG.laserWidth, rc, .8); // TODO: unsure, depends on the default direction of Object.rotation
		sprite.rotation = r;





		
		
		var sp = startingPoint = new Point(x, y);

		// calculate screen intersection
		var d = HP.scene.width + HP.scene.height; // TODO: ? lol
		var ep = endingPoint = getEndPoint(x, y, r, d);

		// TODO:  does it matter if the point is off the screen?
		// i mean, the engine only draws what's on screen, right..?
	
		// TODO: temp debugging
		var b = new Bounds(); // no constructor!.. strange
		b.set(sp.x, sp.y, ep.x, ep.y);
		HP.console.log("bounds " + b.toString());


		/*
		// testing bounds, compare with the bounds i calculate
		// i think they are used to calculate the bounds of all children, heavy stuff
		// results: it works, maybe just slightly off, and maybe different coordinate system
		var b = new Bounds(); // no constructor!.. strange

		HP.console.log("bounds AFTER draw");
		
		b.set(sp.x, sp.y, ep.x, ep.y);
		HP.console.log("my bounds " + b.toString());

		sprite.getBounds(b);
		HP.console.log("getBounds " + b.toString());
		*/

		// using scene coordinates
		//drawLaser(sp.x, sp.y, ep.x, ep.y, GG.laserWidth, rc, .8);
		
		
		GG.scene.add(sprite, GG.Layer.projectiles.getIndex());
		GG.entities.add(this);

		

		// bitmap implementation
		// bitmap = new Bitmap(Tile.fromColor(color));
	}

	public override function dispose() {
		sprite.remove();
		GG.entities.remove(this);

	}

	// call me in main
	public override function update(dt:Float) {
		trace("testing update in laser"); // TODO: UPDATE NOT BEING CALLED!!
		//sprite.alpha -= HP.dt / 10; // TODO: need a simple tween library
		lifeSpan -= dt;	
		if (lifeSpan <= 0)
			sprite.remove();
	}

	// careful: Object already has function named draw
	// TODO: maybe should keep all draw functions seperate from logic
	// that way, can just call all the draw functions at once
	public function drawLaser(x:Float, y:Float, x2:Float, y2:Float, width:Int = 10, ?color:Int = 0xFFFFF, alpha:Float = 1.0) {
		//sprite.clear()?
		sprite.lineStyle(width, color, alpha); 
		//sprite.drawLine(this.x, this.y, x2, y2);
		sprite.moveTo(x, y);
		sprite.lineTo(x2, y2);
	}

	// TODO: surely there are some simple stuff like sprite somewhere..
	// note: structs are useful for returning multiple data fields,
	// but should avoid passing them in, to keep the function more flexible 'n simple
	private function getEndPoint(startingX:Float, startingY:Float, angle:Float, distance:Float):Point {	
		var x2 = startingX + distance * Math.cos(angle);
		var y2 = startingY + distance * Math.sin(angle);
		return new Point(x2, y2);
	}
}
