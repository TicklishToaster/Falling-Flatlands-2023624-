// Inherit the parent event
event_inherited();


// Dynamic Enemy Attributes ///////////////////////////////////////////////////
// Sprite
image_index = irandom_range(0, 7);

//FX
//blend_colour = c_white;
exhaust_counter = 0;

//Steering
position = vect2(x,y); // will be used to update xy
velocity = vect2(0,0);
steering = vect2(0,0); // desired velocity