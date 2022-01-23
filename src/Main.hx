// no imports, just remember where they are in the library
// or just import h2d?

var g:h2d.Graphics; //graphics
var player:hxd.Object;

class Main extends hxd.App {
	    
	override function init() {
		     var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		     tf.text = "Hello World !";
		
			g = new h2d.Graphics(s2d); // s2d is the "default" scene in the App class
			
			// uhhh not so useful...
			paintRectangle(10, 10, 100, 1000);
			
			
			// add playable character
			player = new hxd.Object(s2d);
			
			
			
			// get angle from player's last input direction
			
			

			//check collision between player and laser			//see interactive2d sample, looks simple!! :)
	
			// make a laser collider
			//the "Bounds" 2d box collider looks fine!
			lb = new h2d.col.Bounds;
			lb.xMin = p.x;
			lb.yMin = p.y;
			lb.xMax = p2.x;
			lb.yMax = p2.y;
			//lb.rotate //set to player's last input direction
			

			
      } // init
	
	
	static function main() {
		new Main();
		// what else goes here?
	 }
	
	
	public override update() {
			// move player based on input
			if (hxd.Key.isDown(Key.LEFT)) {
				player.x--;
			}
			if (hxd.Key.isDown(Key.RIGHT)) {
				player.x++;
			}
			if (hxd.Key.isDown(Key.UP)) {
				player.y++;
			}
			if (hxd.Key.isDown(Key.DOWN)) {
				player.y--;
			}
			
			
			if (hxd.Key.isDown(Key.L)) {
				// L is for laser!
				
				// calculate the end xy coordinates based on that angle
				//player.getRotation??
				
				//temp vars
				var p2:hxd.Math.Point = new Point(250, 500);
			
				paintLaser(player.x, player.y, p.x, p2.y);
				
				// as long as the laser is out...
				// check collision
				if (lb.intersects(player.getBounds)) {
				//do something
				}
			}
			
	}
	
	
	
	
	
	public function paintLaser(x:Float, y:Float, x2:Float, y2:Float) {
			//lineStyle( size : Float = 0, color = 0, alpha = 1. ) {
			g.lineStyle(50, 0xFF00FF);
			g.moveTo(x, y)
			g.lineTo(x2, y2);
	    		g.endFill(); 
	}
		
	//useless?
	public function paintRectangle(x:Float, y:Float, width:Float, height:Float, color:Int = 0xFFFFFF, alpha:Float = 1.0) {
   		//g.clear();
    		g.beginFill(color, alpha);
		g.drawRect(x, y, width, height);
    		g.endFill();
	}

} //class main
