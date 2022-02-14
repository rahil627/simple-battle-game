import h2d.Layers;
import h2d.Scene;  //import h3d.scene.Scene;

// a static global helper class, with a scope specific to this app
// store references to commonly-used data structures here
// try to store only references of stuff, no actual objects (except simple types)
class GG {
	
	// only keep references to stuff here
	public static var app:MyPunkApp;
	public static var entities:EntityList<Entity>;
	public static var players:Array<Player>;	
	//public static var players:Vector<Player>; // or this, if the max amount of players never change
	//public static var entitiesBackpack:Map<Int, TargetEntities>; // to search commonly-searched stuff by id (key)	


	// constants
	public static inline final laserWidth = 50;

}

// careful: not to be confused with Layers with an 's'
// note: because files are modules (instead of ds'es), you must use AppGlobal.Layer
// or, put it in it's own file
// note: GG.Layer, where GG is an alias, doesn't work!
// ordered from back to front, 0 is the back, n is the front, -1 is special to put in front-most
enum Layer {
	background;
	players;
	projectiles;
	effects;
	ui;
	console;
}

