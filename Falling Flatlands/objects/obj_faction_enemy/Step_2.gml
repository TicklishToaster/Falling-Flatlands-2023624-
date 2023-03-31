// Inherit the parent event
event_inherited();


// Adjust Velocity ////////////////////////////////////////////////////////////
#region
// Lerp speed to upper/lower limits.
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