
// Cycle through projectile animation frames.
projectile_sprite_frame = clamp(projectile_sprite_frame + projectile_sprite_speed, 0, sprite_get_number(projectile_sprite_id))
if (projectile_sprite_frame >= sprite_get_number(projectile_sprite_id)) {
	projectile_sprite_frame = 0;
}

// Destroy projectile if it goes beyond the camera boundaries.
if (!point_in_rectangle(x, y, Camera.border_x1, Camera.border_y1, Camera.border_x2, Camera.border_y2)) {
	instance_destroy(self, false);
}

// Destroy projectile if hp reduced to 0.
if (projectile_hp <= 0) {
	instance_destroy();
}