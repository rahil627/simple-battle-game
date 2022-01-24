class Player extends h2d.Object {
	
	// simple but not efficient 2d graphics object
	// should use SpriteBatch or TileGroup
	var bitmap:h2d.Bitmap;
	
	// Object has new instead of class name / standard constructor?
	// call me in main.init()
	public function new(scene:h2d.Scene, color:Int) {
    		this.super(scene:h2d.Scene);
		bitmap = new Bitmap(Tile.fromColor(color));
	}
	
	// no init, update, or anything; that's up to you!
	// super simple framework! awesome!!
	
	// call me in the main.update()
	public function update() {
		this.updateMove();
		
	}
	
	private function updateMove() {
		// it makes sense to check for input here
		// because if there is no player, there is no need to check for it
		if (hxd.Key.isDown(Key.LEFT)) {
			this.x--;
		}
		if (hxd.Key.isDown(Key.RIGHT)) {
			this.x++;
		}
		if (hxd.Key.isDown(Key.UP)) {
			this.y++;
		}
		if (hxd.Key.isDown(Key.DOWN)) {
			this.y--;
		}
		
	private function addLaser() {
		if (hxd.Key.isDown(Key.L)) {
		// L is for Laser!
				
		// calculate the end xy coordinates based on that angle
		//player.getRotation??
				
		//temp vars
		var p2:hxd.Math.Point = new Point(250, 500);
		
		Global.canvas.paintLaser(player.x, player.y, p.x, p2.y);
	}

	}
	
	
}
