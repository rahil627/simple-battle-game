import h2d.Object;

class Main extends hxd.App {
	var player:Player;

	override function init() {
		// super(); //no super?

		// set global vars
		HP.scene = this.s2d;

		// add playable character
		player = new Player(HP.scene, 0x0000FF);
	} // init

	// does this dt differ from Timer.dt?
	override function update(dt:Float) {
		// update global vars
		HP.dt = dt;

		player.update();

		// check collision between player and laser
		// Objects have an auto-magic getBounds function tho,
		// see interactive2d sample, looks simple!! :)

		// check collisions
		// if (player.getBounds.intersects(laserColliders)) {
		// do something
		// }

		// nahhh son, this ain't gonna work
		// there's no way to clear each individual laser from the canvas
		// (even if you try to draw over it / erase it,
		// you could be erasing an overlapping laser)
		// need a seperate bitmap for each laser
		// ...and that might be gpu-expensive
		// so, will need to use SpriteBatch or TileGroup?

		// laser needs to be it's own object
		// objects have alpha, i think, which can be used
		// once it's time is up, can remove it

		// you can, however, reserve some memory for a few... 100?
		// that way, there's no need to allocate and de-allocate memory
		// for every laser

		// just use Tile.fromColor(0xFFFFFF) to create the tile
		// then pass it into the bitmap constructor

		// the Graphics class might just be a single bitmap...
	} // update

	// note: must be place at the end? threw an error:
	// module main didn't define object type Main?
	static function main() {
		new Main();
		// what else goes here?
	}
} // class main
