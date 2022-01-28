# simple-battle-game
a simple battle game using heaps.io, to begin my long journey toward the depths of great fighting game systems  

for a long long time now, i've always wanted to make a lot of stuff using Haxe  
so, this is the start of that journey!..  

a journey into true programming  
with command line interfaces,  
shell scripts, and  
vim




#temp post
##title
help: `Key` class [on web/.js build option] not working..? :/

##post
sooooo... I didn’t get very far.. :(

from [the docs](https://heaps.io/documentation/h2d-events-and-interactivity.html) i stole this bit to test inputs:
```
// in Main.hx
// in init()
hxd.Window.getInstance().addEventTarget(onEvent);

function onEvent(event : hxd.Event) {
    trace(HP.debugText += event.toString());
}
```

...aaaand i can see my touch inputs (press, release, coordinates), which is awesome, but, i can’t seem to get the keys to work...

as i understand, that bit of code is supposed to trace all inputs, including keyboard events.

next i’ll

i even tried `Key.initialize()`(!), but i think that’s used internally...

i must mention: i am doing this from an old ipad mini, *but*, i don’t think that matters because this is just the web/`.js` build, not native mobile...
