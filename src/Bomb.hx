import h2d.Graphics;
import h2d.Object;

// classic Bomberman style bomb
class Bomb extends Entity {
	
	var sprite:Graphics;
	var explosion:Graphics;

	public override function new(x:Float = 100, y:Float = 100, r:Float = 0, bombColor:Int = 0xFF0000, laserColor:Int = 0xFFFFFF, alpha:Float = 1) {
		super();
		
		// set Objects' transforms
		sprite = new Graphics(); // don't use constructor parameter parent, use scene.add for Layers
		sprite.x = x;
		sprite.y = y;
		//sprite.rotation = r; // rotate after drawing? // TODO: test this
		
		explosion = new Graphics();
		explosion.x = x;
		explosion.y = y;
		//explosion.rotation = r; // rotate after drawing

		// draw sprites
		var w = GG.laserWidth;

		// draw bomb
		// could just use a bitmap...
		sprite.beginFill(bombColor, alpha);
		sprite.drawRect(x, y, w, w);
		sprite.endFill();
		sprite.tile.center(); // TODO: does this work?, it doesn't have a tile... does it?
		sprite.rotation = r;
		
		// draw laser-like explosion
		// draw horizontal line
		explosion.lineStyle(w, laserColor, alpha);
		explosion.moveTo(0, y);
		explosion.lineTo(HP.scene.width, y); // draws off-screen, but don't think it matters...
	
		// draw vertical line
		explosion.lineStyle(w, laserColor, alpha);
		explosion.moveTo(x, 0);
		explosion.lineTo(x, HP.scene.height);
		
		explosion.rotation = r;

		// add everything to the scene, together, as the same time
		GG.scene.add(sprite, GG.Layer.projectiles.getIndex());
		GG.scene.add(explosion, GG.Layer.projectiles.getIndex());
		
		// keep a reference to this entity
		GG.entities.add(this);
		
		/*
		// TODO: test local 'n global positions
		var p = this.localToGlobal();
		this.beginFill(0x00FF00, .8);
		this.drawRect(p.x, p.y, w, w);
		this.endFill();
		*/
	}


	public override function dispose() {
		sprite.remove();
		explosion.remove();
		GG.entities.remove(this);

	}

	override function update(dt:Float) {
		super.update(dt);

	}
}
