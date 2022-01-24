// no imports, just remember where they are in the library
// can import h2d, hxd though... it's just a LOT of stuff

var player:h2d.Object;

class Main extends hxd.App {
	    
	override function init() {
		     var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		     tf.text = "Hello World !";
		
			// uhhh not so useful...
			canvas.paintRectangle(10, 10, 100, 1000);
			

			// add playable character
			player = new Player(s2d);
			// might have to extend Object to add things to it
			// such as a bitmap
			// otherwise, it doesn't seem like there's much in it...
			// Objects have an auto-magic getBounds function tho,
			// to check collisions against
			
			
			
			// get angle from player's last input direction
			
			

			//check collision between player and laser			//see interactive2d sample, looks simple!! :)
	
			// make a laser collider
			//the "Bounds" 2d box collider looks fine!
			var lb = new h2d.col.Bounds();
			lb.xMin = p.x;
			lb.yMin = p.y;
			lb.xMax = p2.x;
			lb.yMax = p2.y;
			//lb.rotate //set to player's last input direction
			

			
      } // init
	
	
	
	override function update(dt:Float) {
			// move players based on input			
						
				
				// as long as the laser is out...		
								
				// make a laser collider
				//the "Bounds" 2d box collider looks fine!
				var lc = new h2d.col.Bounds();
				lc.xMin = p.x;
				lc.yMin = p.y;
				lc.xMax = p2.x;
				lc.yMax = p2.y;
				//lc.rotate //set to player's last input direction
			

				// check collision			
				if (player.getBounds.intersects(lc)) {
					//do something
				}
			}
			
			
	} //update
	
	
	// note: must be place at the end? threw an error:
	// module main didn't define object type Main?
	static function main() {
		new Main();
		// what else goes here?
	 }

	
	
	
	
	/*
		public function updatelaser(power:Float){
		primative.clear();
		primative.x = x;
		primative.y = y;
		
		primative.moveTo(0, 0);
		primative.lineStyle(2, Col.RED, 0.75 * power);
		primative.lineTo(endx - primative.x + 5, endy - primative.y + 5 - 5);
		primative.lineTo(5, 5);
		primative.visible = true;
	*/
	
		
		
		
} //class main
