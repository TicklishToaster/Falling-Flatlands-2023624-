
// Cycle through projectile animation frames.
projectile_sprite_frame = clamp(projectile_sprite_frame + projectile_sprite_speed, 0, sprite_get_number(projectile_sprite_id))
if (projectile_sprite_frame >= sprite_get_number(projectile_sprite_id)) {
	projectile_sprite_frame = 0;
}


// If object is beyond 0.6x the camera boundaries.
var range_modifier = 0.9;
if (!point_in_rectangle(x, y,	creator.x-obj_camera.camera_width*range_modifier, creator.y-obj_camera.camera_height*range_modifier,
								creator.x+obj_camera.camera_width*range_modifier, creator.y+obj_camera.camera_height*range_modifier)) {			
	instance_destroy(self, false);
}

// Destroy projectile if hp reduced to 0.
if (projectile_hp <= 0) {
	instance_destroy();
}