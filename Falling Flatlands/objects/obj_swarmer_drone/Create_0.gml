// Inherit the parent event
event_inherited();


// Dynamic Enemy Attributes ///////////////////////////////////////////////////
// Sprite
image_index = irandom_range(0, 7);
if (instance_exists(obj_faction_player)) {
	depth = obj_faction_player.depth - 1;
}


//FX
exhaust_counter = 0;

//Steering
position = vect2(x,y);
velocity = vect2(0,0);
steering = vect2(0,0);
