class Main extends hxd.App {
	    override function init() {
		     var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		     tf.text = "Hello World !";
				
			var g = new h2d.Graphics(s2d); // todo: what is s2d?
			g.beginFill(0xFF0000);
			g.drawRect(10, 10, 100, 100);
			g.beginFill(0x00FF00, 0.5);
			g.lineStyle(1, 0xFF00FF);
			g.drawCircle(100, 100, 30);
			g.endFill();

				
	        }
	        static function main() {
			        new Main();
		    }
}
