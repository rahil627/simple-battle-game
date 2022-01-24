// just a place to store commonly-used global objects 'n vars

class G {

	public static var scene: h2d.Scene;

	public static var dt(get, default) : Float;
	static function get_dt() {
    		return hxd.Timer.dt;
  	}
	
	
	// could have multiple canvases... so not a singleton
	// public var canvas:Canvas;
}