import h2d.Graphics;
import h2d.Object;
import h2d.col.Point;

class extends SlowLaser {
	
	var sprite:Graphics;
	var sp:Point;
	var width:Float;

	public override function new(x:Float = 100, y:Float = 100, r:Float = 0, laserColor:Int = 0xFFFFFF, alpha:Float = 1) {
		super();
		
		// set Objects' transforms
		sprite = new Graphics(); // don't use constructor parameter parent, use scene.add for Layers
		sprite.x = x;
		sprite.y = y;
		sprite.rotation = r; // ? un-rotate, draw, then rotate, for every update/draw call?

		// draw sprites
		width = GG.laserWidth;
		
		// draw laser
		// draw horizontal line
		sprite.lineStyle(w, laserColor, alpha);
		sprite.moveTo(0, y);
		sprite.lineTo(HP.scene.width, y); // draws off-screen, but don't think it matters...
		
		explosion.rotation = r;

		// add everything to the scene, together, as the same time
		GG.scene.add(sprite, GG.Layer.projectiles.getIndex());
		
		// keep a reference to this entity
		GG.entities.add(this);
	}


	public override function dispose() {
		sprite.remove();
		GG.entities.remove(this);

	}

	override function update(dt:Float) {
		super.update(dt);

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
