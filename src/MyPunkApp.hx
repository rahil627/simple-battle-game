import h2d.Layers;

import hxd.Math;
import h2d.Object;
import hxd.Key;
import h2d.Interactive;
import h2d.Graphics;

// just a bare-bones App/Main to copy to begin a new project with
// the data is all optional, feel free to delete!
// rename the class, constructor call, 'n filename and you're good to go!
class MyPunkApp extends PunkApp {

	// note: Layers is only useful for 2d
	// TODO: Scene extends Layers sooooo.. don't really need this???
	var world:Layers; // just a helper tool to put things in the right place in a 2d scene tree
	var entities:EntityList<Entity>;
	var players:EntityList<Entity>;
	
	var justTouchPressed = false;


	// called during application setup after `loadAssets` completed (from docs)
	override function init() {
		super.init();
		HP.setup(false);
		/*
		 // config screen stuff
		 // the hxml file can set some of these too, not sure which has priority tho
		 // not sure what defaultsmooth nor usescreenpixels do... just a sample from deepnight
		 HP.windowDisplayMode = hxd.DisplayMode.Windowed;
		 HP.scene.defaultSmooth = true;
		 HP.sceneScaleMode = LetterBox(1280, 720, false, Center, Center);
		 #if js
		 HP.window.useScreenPixels = true;
		 #end
		 HP.engine.backgroundColor = 0xFF31A2F2;

		 #if sys
		 hxd.Res.initLocal(); // important! allows the app access to our game's resource files: images (sprites), audio, etc.
		 #else
		 hxd.Res.initEmbed(); // use hxd.Res.initEmbed(); for html5/js
		 #end
		*/
		// init app globals
		//AppGlobal.app = this; // this is a little different from HP.app, which uses the base class
		AppGlobal.world = world;
		AppGlobal.entities = entities;
		AppGlobal.players = players;
		
		 // init app stuff
		 world = new Layers(HP.scene);
		 entities = new EntityList<Entity>();
		 players = new EntityList<Player>();
		 //var monster = new Entity(); // just be sure to store the reference to entities somewhere safe!
		
		//var numOfPlayers = 2;
		//for (i = 1; i <= numOfPlayers; i++)
		players.add(new Player(HP.scene, 0x0000FF));
		players.add(new Player(HP.scene, 0xFF00FF));
		
		
		
		// TODO temp solution until i fix keys
		HP.screenInputHandler.onPush = touchPressed;


	}
	
	public function reset() {
		entities.clear();
		world = new Layers(); // TODO: lol, dunno how to dispose, the array is private, *i think* it's just a tiny array of indicies anyway.., no content
	}
	
	// called each frame right before rendering (from docs)
	// first call is done after the application is set up (so `loadAssets` and `init` are called (from docs)
	override function update(dt:Float) {
		super.update(dt);
		entities.update(dt);
		
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
			
			new Laser(HP.scene, Math.random() * HP.scene.width, Math.random() * HP.scene.height, 0, ra.Haxe.randomHex()); // Math.random() * Math.PI * 2
			new Bomb(HP.scene, Math.random() * HP.sceneWidth, Math.random() * HP.sceneHeight, 0, 0xFF0000, ra.Haxe.randomHex(), .7);
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
		
		
	}
	
	function touchPressed(e:hxd.Event) {
		justTouchPressed = true;
	}

	
	// note: must be placed at the end? threw an error:
	// module main didn't define object type Main?
	static function main() {
		new MyPunkApp();
		// can store an instance of it... but, for what? for now HP.app is the parent PunkApp class
	}
}
