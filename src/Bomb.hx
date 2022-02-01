import h2d.Graphics;
import h2d.Object;
import ra.Haxe;

// classic Bomberman style bomb
class Bomb extends Graphics {

	public override function new(parent:Object, x:Float = 100, y:Float = 100, r:Float = 0, bombColor:Int = 0xFF0000, laserColor:Int = 0xFFFFFF, alpha:Float = 1) {
		super(parent);
		this.x = 0; // don't use these! just draw using absolute coordinates
		this.y = 0;
		this.rotation = r;


		// init
		var w = Glob.laserWidth;

		// draw bomb
		this.beginFill(bombColor, alpha);
		this.drawRect(x, y, w, w);
		this.endFill();

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

		// draw horizontal line
		this.lineStyle(w, laserColor, alpha);
		this.moveTo(0, y);
		this.lineTo(HP.scene.width, y);
	
		// draw vertical line
		this.lineStyle(w, laserColor, alpha);
		this.moveTo(x, 0);
		this.lineTo(x, HP.scene.height);
	}

	// note: optional; not an override
	public function update() {

	}
}
