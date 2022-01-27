import hxd.Math;
import h2d.Object;
import h2d.Bitmap;
import h2d.Tile;
import hxd.Key;

class Player extends Object {
	
	// adjustable vars
	var moveSpeed = 1;


	var weaponDirection:Float = 0.0;

	// simple but not efficient 2d graphics object
	// should use SpriteBatch or TileGroup
	var bitmap:h2d.Bitmap;

	// Object has new instead of class name / standard constructor?
	// call me in main.init()
	public override function new(?parent:Object, color:Int) {
		super(parent); // this.super() didn't work...
		this.x = HP.scene.width / 2;
		this.y = HP.scene.height / 2;


		// just use a simple bitmap for now..
		// this somehow draws to the screen automatically, as long as it's on the scene
		bitmap = new Bitmap(Tile.fromColor(color), this);
		bitmap.width = 100;
		bitmap.height = 100;
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
		// ghetto movement code
		// TODO:these just dont work right...
		// neither the movement nor rotation work
		// only down once, then up once, wtf?
		if (Key.isDown(Key.RIGHT)) {
			this.x += HP.dt * moveSpeed;
			//this.rotation = 0;
			weaponDirection = 0;
			// i'm not sure how the coordinate system works...
			// should be easy to get angle from gamepad sticks tho
		}
		if (Key.isDown(Key.DOWN)) {
			this.y -= HP.dt * moveSpeed;
			//this.rotation = Math.PI / 2; 
			weaponDirection = Math.PI / 2;
		}
		if (Key.isDown(Key.LEFT)) {
			this.x -= HP.dt * moveSpeed;
			//this.rotation = Math.PI; 
			weaponDirection = Math.PI;
		}
		if (Key.isDown(Key.UP)) {
			this.y += HP.dt * moveSpeed;
			//this.rotation = Math.PI * 1.5; 
			weaponDirection = Math.PI * 1.5;
		}

		// update attacks
		if (Key.isPressed(Key.L)) {
			// L is for Laser!
			//TODO: look at heaps for debug output trace statements
			addLaser();
		}


	}

	private function addLaser() {
		// note: add laser to the scene, not the player!
		// that way, the coordinates are simple
		// also, can just add player.id to the laser
		new Laser(HP.scene, this.x, this.y, this.rotation);
		// or HP.scene.addChild())?
		HP.scene.addChild(new Laser(this.x, this.y, this.rotation));
		// maybe later on can switch to holding the button down
		// makes it latch on to the player
		// until the player lets go of the button
		// this.addChild(l);
	}
}
