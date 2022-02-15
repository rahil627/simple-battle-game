import hxd.Math;
import h2d.Object;
import h2d.Bitmap;
import h2d.Tile;
import hxd.Key;

class Player extends Entity {

	// const vars

	// adjustable vars
	var moveSpeed = 100;
	var weaponDirection = 0.0;

	// simple but not efficient 2d graphics object
	// should use SpriteBatch or TileGroup
	var sprite:h2d.Bitmap;
	
	var x:Float;
	var y:Float;
	var r:Float;

	// call me in main.init()
	public override function new(color:Int) {
		super(); 

		// just use a simple bitmap for now..
		// this somehow draws to the screen automatically
		sprite = new Bitmap(Tile.fromColor(color));
		sprite.x = HP.scene.width / 2;
		sprite.y = HP.scene.height / 2;	
		sprite.width = 100;
		sprite.height = 100;
		sprite.tile.center();
		
		// use the sprite as the main reference for transform
		x = sprite.x;
		y = sprite.y;
		r = sprite.rotation;

		MyPunkApp.inst.scene.add(sprite, GG.Layer.projectiles.getIndex()); // just an exanple of singleton vs globals
		MyPunkApp.inst.players.push(this); // basically: MyApp.inst.field vs GG.field
	}

	// no init, update, or anything; that's all up to you!
	// super simple framework! awesome!!
	
	// call me in the main.update()
	public override function update(dt:Float) {
		updateInputs();
	}

	private function updateInputs() {
		// it makes sense to check for input here
		// because if there is no player, there is no need to check for it
		// ...but, maybe in the future can leave in the main update
		// to clearly seperate input and output

		// update moves
		// ghetto movement code
		// TODO:these just dont work right...
		if (Key.isDown(Key.RIGHT)) {
			x += HP.dt * moveSpeed; // ~1/60 * 100 = 100 pixels per second
			//this.rotation = 0;
			weaponDirection = 0;
			// i'm not sure how the coordinate system works...
			// should be easy to get angle from gamepad sticks tho
		}
		if (Key.isDown(Key.DOWN)) {
			y -= HP.dt * moveSpeed;
			//this.rotation = Math.PI / 2; 
			weaponDirection = Math.PI / 2; // note: learn to use radians, not degrees!
		}
		if (Key.isDown(Key.LEFT)) {
			x -= HP.dt * moveSpeed;
			//this.rotation = Math.PI; 
			weaponDirection = Math.PI;
		}
		if (Key.isDown(Key.UP)) {
			y += HP.dt * moveSpeed;
			//this.rotation = Math.PI * 1.5; 
			weaponDirection = Math.PI * 1.5;
		}

		// update attacks
		if (Key.isPressed(Key.L)) {
			// L is for Laser!
			//TODO: look at heaps docs to figure out how to debug using trace statements
			trace("pressed L");
			addLaser();
		}


	}

	private function addLaser() {
		// note: add laser to the scene, not the player!
		// that way, the coordinates are simple
		// also, can just add player.id to the laser
		new Laser(x, y, r, 0xFF0000); // TODO: maybe need to do localToGlobal
		// maybe later on can switch to holding the button down
		// makes it latch on to the player
		// until the player lets go of the button
	}
}
