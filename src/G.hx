// just a place to store commonly-used global objects 'n vars

class G {

	// hopefully just a reference..?
	public static var scene: h2d.Scene;  // = App.s2d

	public static var dt(get, default) : Float;
	static function get_dt() {
    		return hxd.Timer.dt;
  	}
	
	
	// could have multiple canvases... so not a singleton
	// public var canvas:Canvas;
}