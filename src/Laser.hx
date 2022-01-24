import h2d.Object;
import h2d.Graphics;
import hxd.Math;
import hxd.Timer;

class Laser extends Object {

	var g:Graphics;
	var color:Int;

	public override function new(?parent:Object, x:Float, y:Float, rotation:Float, color:Int = 0xFFFFFF) {
    		super(parent);
		this.x = parent.x; // starting point
		this.y = parent.y;
		this.rotation = rotation; // needed to calculate end-point
		this.color = color;
		//bitmap = new Bitmap(Tile.fromColor(color));
	}
	
	// call me in main
	public function update() {
		//this.alpha -= .00001 * Math.dt;
	}
	
	// override for custom drawing stuff
	// is this automatically called?
	public override function draw(ctx : h2d.RenderContext) {
		// calculate end-point
		var angle = this.rotation;
		
		var d = G.scene.width + G.scene.height; // todo: lol
		var x2 = this.x + d * Math.cos(angle);
		var y2 = this.y + d * Math.sin(angle);
		
		// does it matter if the point is off the screen?
		// i mean, the engine only draws what's on screen, right..?
		
		g.lineStyle(50, this.color, .8); // todo: set random color
		drawLine(this.x, this.y, x2, y2);
	}
	
	private function drawLine(x:Float, y:Float, x2:Float, y2:Float) {
		//lineStyle( size : Float = 0, color = 0, alpha = 1. ) {
		//g.clear?
		g.moveTo(x, y);
		g.lineTo(x2, y2);
   		g.endFill();
		//g.visible?
	}


}