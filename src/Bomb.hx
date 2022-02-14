import h2d.Graphics;
import h2d.Object;

// classic Bomberman style bomb
class Bomb extends Entity {
	
	var sprite:Graphics;

	public override function new(parent:Object, x:Float = 100, y:Float = 100, r:Float = 0, bombColor:Int = 0xFF0000, laserColor:Int = 0xFFFFFF, alpha:Float = 1) {
		super(parent);
		sprite = new Graphics(); // don't use constructor parameter parent, use scene.add for Layers
		//this.x = 0; // don't use these! just draw using absolute coordinates
		//this.y = 0;
		sprite.rotation = r;


		// init
		var w = GG.laserWidth;

		// draw bomb
		sprite.beginFill(bombColor, alpha);
		sprite.drawRect(x, y, w, w);
		sprite.endFill();

		// draw laser-like explosion

		/*
		// TODO: test local 'n global positions
		var p = this.localToGlobal();
		this.beginFill(0x00FF00, .8);
		this.drawRect(0, 0, w, w);
		this.endFill();

		// then just draw from p0,0 to 4 directions
		// TODO: local coordinates is actually much nicer,
		// keeping the object all-together in one place
		*/

		// draw horizontal line (without any rotation)
		sprite.lineStyle(w, laserColor, alpha);
		sprite.moveTo(0, y);
		sprite.lineTo(HP.scene.width, y);
	
		// draw vertical line
		sprite.lineStyle(w, laserColor, alpha);
		sprite.moveTo(x, 0);
		sprite.lineTo(x, HP.scene.height);

		MyPunkApp.inst.scene.add(sprite, GG.Layer.projectiles.getIndex());
		MyPunkApp.inst.entities.add(this);
	}


	public override function dispose() {
		sprite.remove();

	}

	override function update(dt:Float) {
		super.update(dt);

	}
}
