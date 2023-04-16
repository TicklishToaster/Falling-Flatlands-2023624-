// Inherit the parent event
event_inherited();


// Check if object should be destroyed.
if (health_points <= 0){
	instance_destroy();
}


// Calculate Pseudo-I-Frames //////////////////////////////////////////////////
// Countdown collision damage cooldown.
if (collision_damage_cooldown) {
	collision_damage_timer = clamp(collision_damage_timer - (room_speed / 60 / 60), 0, collision_damage_timer_max);
	if (collision_damage_timer) <= 0 {
		collision_damage_cooldown	= false;
		collision_damage_timer		= collision_damage_timer_max;
	}
}


// Adjust Velocity ////////////////////////////////////////////////////////////
#region
// Lerp speed to upper/lower limits if they exceed them.
if (speed > max_speed) {
	speed = lerp(speed, max_speed, acceleration);
}
else if (speed < -max_speed) {
	speed = lerp(speed, -max_speed, acceleration);
}
#endregion


// Room Boundaries ////////////////////////////////////////////////////////////
#region
// Bounce this object off the edges of the room if they attempt to go out of bounds.
var bounce_min = 1;
if (bbox_top <= 0) {
	motion_set(-90,	max(vspeed/2, bounce_min));
}

if (bbox_bottom >= room_height) {
	motion_set(90,  max(vspeed/2, bounce_min));
}

if (bbox_left <= 0) {
	motion_set(0,   max(hspeed/2, bounce_min));
}

if (bbox_right >= room_width) {
	motion_set(180, max(hspeed/2, bounce_min));
}
#endregion