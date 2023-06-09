// Inherit the parent event
event_inherited();


//// If the ship is within the room boundaries.
//if (bbox_top > 0 && bbox_bottom < room_height && bbox_left > 0 && bbox_right < room_width) {
//	if (!place_meeting(x, y, obj_projectile)) {
//		// Force ship to only move in the direction it's facing.
//		direction = image_angle;
//	}
//}


// Collision damage cooldown (dealt).
collider_timer = clamp(collider_timer - 1, 0, 20);
if (collider_timer <= 0) {
	last_collider = noone;
}