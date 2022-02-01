enum EntityKind {
	player;
	monster;
	etc;
}

// i'm not sure what an entity really is...
// but this one will liekly contain an Object, or anything that extends an Object
class Entity {	

	var kind:EntityKind;
	//var sprite:Object; // Object and it's extensions: Drawable, Graphics, Anim, etc.

	// override me! and call super();
	// TODO: init in constuctor vs in init()
	public function new() {
		//game = Game.inst; // just use global
		//inf = Data.object.get(kind); // castle db stuff
		//this.x = x;
		//this.y = y;
		//sprite = new h2d.Anim(getAnim(), 15);
		//HP.app.world.add(spr, hasFlag(Under) ? Game.LAYER_ENT_UNDER : Game.LAYER_ENT);
		HP.entities.push(this);
	}

	// override me!
	public function update(dt:Float) { // TODO: pass in dt vs global dt
		// do stuff! 
	}

	// override me!
	public function remove() {
		// do stuff!
		//sprite.remove();
		//HP.app.entities.remove(this);
	}
}
