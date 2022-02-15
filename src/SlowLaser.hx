import h2d.Graphics;
import h2d.Object;
import h2d.col.Point;

class extends SlowLaser {
	
	var sprite:Graphics;
	var p1:Point;
	var p2:Point;
	var width:Float;
	var length:Float;
	
	// constants that requires fine adjustments
	var lengthScaler:Float = .01; // segment length drawn per update

	public override function new(x:Float = 100, y:Float = 100, r:Float = 0, laserColor:Int = 0xFFFFFF, alpha:Float = 1) {
		super();
		
		// set Objects' transforms
		sprite = new Graphics(); // don't use constructor parameter parent, use scene.add for Layers
		//sprite.x = x; // just use scene/screen coordinates
		//sprite.y = y;
		//sprite.rotation = r; // ? un-rotate, draw, then rotate, for every update/draw call?
		
			
		var sp = startingPoint = new Point(x, y);

		// calculate screen intersection
		var d = HP.scene.width + HP.scene.height; // TODO: ? lol, off-screen, laziness
		var ep = endingPoint = getEndPoint(x, y, angle, d);

		// draw sprites
		width = GG.laserWidth;
		length = lengthScaler;
		
		// draw laser
		// draw horizontal line
		sprite.lineStyle(w, laserColor, alpha);
		sprite.moveTo(0, y);
		sprite.lineTo(HP.scene.width, y); // draws off-screen, but don't think it matters...
		
		//sprite.rotation = r;

		GG.scene.add(sprite, GG.Layer.projectiles.getIndex());
		GG.entities.add(this);
	}


	public override function dispose() {
		sprite.remove();
		GG.entities.remove(this);

	}
	
	// try not to create any vars in update
	var rc:Int;

	override function update(dt:Float) { // TODO: is update called on the first frame after init or second frame?
		super.update(dt);
		
		// two ways: either
		// clear the graphics, and re-draw a longer line, or
		// draw the next segment
		
		// TODO: need a tween function?
		// TODO: should play with a path lib too
		
		// clear and re-draw way
		//sprite.rotation = 0;
		rc = ra.Haxe.randomHex();
		sprite.clear();
		drawLaser(p1.x, p1.y, p2.x * length, p2.y * length, GG.laserWidth, rc, .8);
		length += lengthScaler * dt;
		//sprite.rotation = angle;
		
		// draw segment way
		// ...

		// if it reaches off screen, ... do something? hmmm, haven't thought about it yet...
	}
	
	// just copy-pasta these two functions from Laser for now...

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
