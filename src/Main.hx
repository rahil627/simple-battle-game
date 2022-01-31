import ra.hp.PunkApp;
import ra.Haxe;
import hxd.Math;
import h2d.Object;
import hxd.Key;
import h2d.Interactive;
import h2d.Graphics;

class Main extends PunkApp  {
	var player:Player;
	var justTouchPressed = false;
	
	override function init() {
		super.init();

		// single graphics drawing class implementation
		// can later extend it if needed.. (Canvas.hx)
		//Glob.pen = new Graphics(HP.scene);
	
		player = new Player(HP.scene, 0x0000FF);

		// TODO temp solution until i fix keys
		HP.screenInputHandler.onPush = touchPressed;
	

	} // init

	override function update(dt:Float) {
		super.update(dt);

		// ideally:
		// do logic stuff based on input *first*
		// *then* draw


		// update game stuff	
		player.update();
		
		// TODO: testing input continued
		if (Key.isPressed(Key.K) || Key.isDown(Key.J) || Key.isDown('H'.code)) {
			HP.console.log("yay, the buttons finally work!!");

		}

		if (justTouchPressed) {
			justTouchPressed = false;
			
			new Laser(HP.scene, Math.random() * HP.scene.width, Math.random() * HP.scene.height, 0, Haxe.randomHex()); // Math.random() * Math.PI * 2
			new Bomb(HP.scene, Math.random() * HP.sceneWidth, Math.random() * HP.sceneHeight, 0, 0xFF0000, Haxe.randomHex(), .7);
		}

	



		// check collision between player and laser
		// Objects have an auto-magic getBounds function tho,
		// see interactive2d sample, looks simple!! :)

		// check collisions
		// if (player.getBounds.intersects(laserColliders)) {
		// do something
		// }

		// laser needs to be it's own object
		// objects have alpha, i think, which can be used
		// once it's time is up, can remove it

		// you can, however, reserve some memory for a few... 100?
		// that way, there's no need to allocate and de-allocate memory
		// for every laser

		// just use Tile.fromColor(0xFFFFFF) to create the tile
		// then pass it into the bitmap constructor

		// the Graphics class might just be drawing diredctly to the screen!..
	} // update

	function touchPressed(e:hxd.Event) {
		justTouchPressed = true;
	}

	// note: must be placed at the end? threw an error:
	// module main didn't define object type Main?
	static function main() {
		new Main();
		// what else goes here?
	}
} // end of main class 
