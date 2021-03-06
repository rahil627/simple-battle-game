import h2d.Layers;

import hxd.Math;
import h2d.Object;
import hxd.Key;
import h2d.Interactive;
import h2d.Graphics;
import h2d.Scene;

import hp.PunkApp;

// just a bare-bones App/Main to copy to begin a new project with
// the data is all optional, feel free to delete!
// rename the class, constructor call, 'n filename and you're good to go!
class MyPunkApp extends PunkApp {

	// note: Layers is only useful for 2d
	// TODO: Scene extends Layers sooooo.. don't really need this???

	// public, basically game globals
	public static var inst:MyPunkApp; // static singleton
	public var scene:Scene;
	public var entities:EntityList<Entity>;
	public var players:Array<Player>;
	
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
		
		// init app globals // TODO: make an init function in GG
		GG.app = MyPunkApp.inst = this; // this is a little different from HP.app, which uses the base class

		// optional globals
		GG.scene = this.s2d;
		GG.entities = entities;
		GG.players = players;
		
		 // init app stuff
		scene = this.s2d;
		entities = new EntityList<Entity>();
		players = new Array<Player>(); // TODO: or = [] ?
		
		//var numOfPlayers = 2;
		//for (i = 1; i <= numOfPlayers; i++)
		players[0] = new Player(0x0000FF);
		players[1] = new Player(0xFF00FF);
		
		
#if debug	
		// TODO temp solution until i fix keys
		HP.screenInputHandler.onPush = touchPressed;
#end

		// not sure of the difference, but ok...
		// need to finish the callback up to work on EPush
		//HP.scene.startCapture(touchPressed); // stopInput callback parameter,  also has a strange touchid third parameter...

	}
	
	public function reset() {
		entities.clear();
		players = []; // TODO: add extension function .clear() to Array?
		//world = new Layers(); // TODO: lol, dunno how to dispose, the array is private, *i think* it's just a tiny array of indicies anyway.., no content
	}
	
	// called each frame right before rendering (from docs)
	// first call is done after the application is set up (so `loadAssets` and `init` are called (from docs)
	override function update(dt:Float) {
		super.update(dt);
		
		// ideally:
		// do logic stuff based on input *first*
		// *then* draw
		
		// update game stuff
		for (p in players)
			p.update(dt);
	
		//entities.update(dt); // TODO why wouldn't this work?
		// it reaches EntityList update, but, i don't think it can call update
		// because it's using generics, i think, so it has to be casted
		// so, i might have to make EntityList  a non-generic class (don't use T, use Entity)
		// but wouldn't that ruin teh point?..

		/*
		// how the eff do none of these work??
		for (e in entities.entities) {
			(cast e).update(dt);
			(cast (e, Entity)).update(dt);
			(e.as(Entity)).update(dt); // also without parenthesis doesn't work neither..
		}
		*/

		// TODO: testing input continued
		if (Key.isPressed(Key.K) || Key.isDown(Key.J) || Key.isDown('H'.code)) {
			HP.console.log("yay, the buttons finally work!!");

		}

		if (justTouchPressed) {
			justTouchPressed = false;

			// Scene.mousX/Y do not work for touches!! returns 0/-40
			// TODO: testing scene.startCapture
			if(HP.scene.mouseX != 0.0 && HP.scene.mouseY != 0.0)
				trace("mouseX/Y: " + HP.scene.mouseX + " " + HP.scene.mouseY);
			//	trace("mouseX/Y: " + HP.window.mouseX + " " + HP.window.mouseY);
		
			// MAIN TESTING AREA
			new Laser(touchX, touchY, Math.random() * Math.PI * 2, ra.Haxe.randomHex());
			//new Bomb(touchX, touchY, Math.random() * Math.PI * 2, 0xFF0000, ra.Haxe.randomHex(), .7);
			//new SlowLaser(touchX, touchY, Math.random() * Math.PI * 2, ra.Haxe.randomHex(), .7);

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


	var touchX:Float = 0;
	var touchY:Float = 0;
	function touchPressed(e:hxd.Event) {
		/*
		switch (e) {
			case EPush:

			case EMove:
			case EReleased:

		}
		*/

		trace("touch input works!");
		justTouchPressed = true;
		touchX = e.relX;
		touchY = e.relY;
	}

	
	// note: must be placed at the end? threw an error:
	// module main didn't define object type Main?
	static function main() {
		new MyPunkApp();
		// can store an instance of it... but, for what? for now HP.app is the parent PunkApp class
	}

}
