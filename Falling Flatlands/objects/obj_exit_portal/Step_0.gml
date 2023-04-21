
// Cycle through projectile animation frames.
exit_portal_sprite_frame = clamp(exit_portal_sprite_frame + exit_portal_sprite_speed, 0, sprite_get_number(sprite_index))
if (exit_portal_sprite_frame >= sprite_get_number(sprite_index)) {
	exit_portal_sprite_frame = 0;
}
