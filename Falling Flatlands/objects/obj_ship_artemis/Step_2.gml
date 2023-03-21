// Inherit the parent event
event_inherited();


// Cycle through crosshair target animation frames.
if (crosshair_target_sprite_frame != sprite_get_number(crosshair_target_sprite_id)-1) {
	crosshair_target_sprite_frame = clamp(crosshair_target_sprite_frame + crosshair_target_sprite_speed, 0, sprite_get_number(crosshair_target_sprite_id)-1)
}