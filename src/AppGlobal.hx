import h2d.Layers;
import h2d.Scene;  //import h3d.scene.Scene;

// a static global helper class, with a scope specific to this app
// store references to commonly-used data structures here
// try to store only references of stuff, no actual objects (except simple types)
// TODO: singleton vs static
class AppGlobal {
	
	// only keep references to stuff here
	//public static var app:MyPunkApp;
	public static var scene:Scene;
	
 	public static var world:Layers;
	
	public static var entities:EntityList<Entity>;
	public static var players:Array<Player>;	
	//public static var players:Vector<Player>; // or this, if the max amount of players never change
	//public static var entitiesBackpack:Map<Int, TargetEntities>; // to search commonly-searched stuff by id (key)	


	// constants
	public static inline final laserWidth = 50;

}

// careful: not to be confused with Layers with an 's'
enum Layer {
	background;
	players;
	projectiles;
	effects;
	ui;
}
