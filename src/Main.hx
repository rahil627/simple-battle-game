import h2d.Object;
import hxd.Key;
import h2d.Graphics;

class Main extends hxd.App {
	var player:Player;

	override function init() {
		// super(); //no super?  
		
		// set global vars
		HP.scene = this.s2d;
		
		// init ghetto  debug console
		HP.debugText =  new h2d.Text(hxd.res.DefaultFont.get(), HP.scene);
		HP.debugText.text += "Hello World !";
		
		// is this needed??
		Key.initialize();

		// TODO: debugging input
		hxd.Window.getInstance().addEventTarget(onEvent);

		// use a single graphics drawing class
		// can later extend it if needed.. (Canvas.hx), not used
		// but for now.. i put the drawing code in Laser.hx
		G.pen = new Graphics(HP.scene);

		//:TODO: testing	
		new Laser(HP.scene, 0, 0, -1000, 500);

		// add playable character
		player = new Player(HP.scene, 0x0000FF);
	

	} // init

	// TODO: testing input
	function onEvent(event : hxd.Event) {
	    trace(HP.debugText.text += event.toString());
				
	}

	// does this dt differ from Timer.dt?
	override function update(dt:Float) {
		// update global vars
		HP.dt = dt;

		// update game stuff	
		player.update();
		
		// testing input continued, but keep the random code!! :)
		if (Key.isPressed(Key.K) || Key.isDown(Key.J) || Key.isDown('H'.code)) {
			trace("pressed DOWN");
			var color:Int = Math.round(Math.random()*0xFFFFFF);

			new Laser(HP.scene, Math.random() * HP.scene.width, Math.random() * HP.scene.height, Math.random() * Math.PI * 2, color);

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

	// note: must be placed at the end? threw an error:
	// module main didn't define object type Main?
	static function main() {
		new Main();
		// what else goes here?
	}
} // end of main class 
