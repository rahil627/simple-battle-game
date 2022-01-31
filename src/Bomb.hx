import h2d.Graphics;
import h2d.Object;
import ra.Haxe;

// classic Bomberman style bomb
class Bomb extends Graphics {

	public override function new(parent:Object, x:Float = 100, y:Float = 100, r:Float = 0, bc:Int = 0xFF0000, lc:Int = 0xFFFFFF) {
		super(parent);
		this.x = x;
		this.y = y;
		this.rotation = r;
		
		// init
		var w = Glob.laserWidth;

		// draw bomb
		this.beginFill(bc, .8);
		this.drawRect(0, 0, w, w);
		this.endFill();

		// draw laser-like explosion
		//this.localToGlobal( // TODO might need..?

		// draw line along y
		this.lineStyle(w, lc, .8);
		this.moveTo(0, y);
		this.lineTo(0, HP.scene.height);
	
		// draw line along x
		this.lineStyle(w, lc, .8);
		this.moveTo(x, 0);
		this.lineTo(HP.scene.width, 0);
	}

	// note: optional; not an override
	public function update() {

	}
}
