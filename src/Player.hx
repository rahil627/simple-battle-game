import hxd.Math;
import h2d.Object;
import h2d.Bitmap;
import h2d.Tile;
import hxd.Key;

class Player extends Object {
	
	// simple but not efficient 2d graphics object
	// should use SpriteBatch or TileGroup
	var bitmap:h2d.Bitmap;
	
	// Object has new instead of class name / standard constructor?
	// call me in main.init()
	public override function new(?parent:Object, color:Int) {
    		super(parent); // this.super() didn't work...
		bitmap = new Bitmap(Tile.fromColor(color), this);
	}
	
	// no init, update, or anything; that's up to you!
	// super simple framework! awesome!!
	
	// call me in the main.update()
	public function update() {
		this.updateInputs();
		
	}
	
	private function updateInputs() {
		// it makes sense to check for input here
		// because if there is no player, there is no need to check for it
		
		// update moves
		if (hxd.Key.isDown(Key.RIGHT)) {
			this.x++;
			this.rotation = 0;
			// i'm not sure how the coordinate system works...
			// should be easy to get angle from gamepad sticks tho
		}
		if (hxd.Key.isDown(Key.DOWN)) {
			this.y--;
			this.rotation = Math.PI / 2;
		}
		if (hxd.Key.isDown(Key.LEFT)) {
			this.x--;
			this.rotation = -Math.PI;
		}
		if (hxd.Key.isDown(Key.UP)) {
			this.y++;
			this.rotation = Math.PI * 1.5;
		}
		
		// update attacks
		if (hxd.Key.isPressed(Key.L)) {
			// L is for Laser!
			this.addLaser();
		}
	}
		
	private function addLaser() {	
		// add laser to the scene, not the player!
		new Laser(G.scene, this.x, this.y, this.rotation);
		//or G.scene.addChild())?
		
		// later on can switch to holding the button down
		// makes it latch on to the player
		// until the player lets go of the button
		//this.lasers.addChild(l);
	}
	
	
}
