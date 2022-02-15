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
}
