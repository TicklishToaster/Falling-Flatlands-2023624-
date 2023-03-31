
// Cycle through projectile animation frames.
projectile_sprite_frame = clamp(projectile_sprite_frame + projectile_sprite_speed, 0, sprite_get_number(projectile_sprite_id))
if (projectile_sprite_frame >= sprite_get_number(projectile_sprite_id)) {
	projectile_sprite_frame = 0;
}

// Destroy projectile if it goes beyond the camera boundaries.
var border_x1 = uc_get_view_x() - Camera.camera_width  / 5;
var border_y1 = uc_get_view_y() - Camera.camera_height / 5;
var border_x2 = uc_get_view_x() + Camera.camera_width  / 5 + Camera.camera_width;
var border_y2 = uc_get_view_y() + Camera.camera_height / 5 + Camera.camera_height;
if (!point_in_rectangle(x, y, border_x1, border_y1, border_x2, border_y2)) {
	instance_destroy(self, false);
}

// Destroy projectile if hp reduced to 0.
if (projectile_hp <= 0) {
	instance_destroy();
}