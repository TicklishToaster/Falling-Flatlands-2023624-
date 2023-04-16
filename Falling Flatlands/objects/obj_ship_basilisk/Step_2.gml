// Inherit the parent event
event_inherited();


// Cycle through crosshair target animation frames.
if (crosshair_target_sprite_frame != sprite_get_number(crosshair_target_sprite_id)-1) {
	crosshair_target_sprite_frame = clamp(crosshair_target_sprite_frame + crosshair_target_sprite_speed, 0, sprite_get_number(crosshair_target_sprite_id)-1)
}


// If the ship is within the room boundaries.
if (bbox_top > 0 && bbox_bottom < room_height && bbox_left > 0 && bbox_right < room_width) {
	// If the ship is not overlapping an enemy.
	if (!collision_rectangle(
		x - sprite_width /4,
		y - sprite_height/4,
		x + sprite_width /4,
		y + sprite_height/4,
		obj_faction_enemy, true, true)) 
		{
		// Force ship to only move in the direction it's facing.
		direction = image_angle;
	}
}