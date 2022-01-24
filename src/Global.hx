// just a place to store commonly-used global objects 'n vars

public class G {

	public var scene(get, default):h2d:Scene;
	function get_scene() {
    		return App.s2d;
  	}

	public var dt(get, default):Float;
	function get_scene() {
    		return hxd.Timer.dt;
  	}
	
	
	// could have multiple canvases... so not a singleton
	// public var canvas:Canvas;
}