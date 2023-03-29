
// Cycle through projectile animation frames.
projectile_sprite_frame = clamp(projectile_sprite_frame + projectile_sprite_speed, 0, sprite_get_number(projectile_sprite_id))
if (projectile_sprite_frame >= sprite_get_number(projectile_sprite_id)) {
	projectile_sprite_frame = 0;
}


// If object is beyond the camera boundaries.
if (!point_in_rectangle(x, y, 
	obj_camera.x - obj_camera.camera_width  / 10, 
	obj_camera.y - obj_camera.camera_height / 10, 
	obj_camera.x + obj_camera.camera_width  + obj_camera.camera_width  / 10, 
	obj_camera.y + obj_camera.camera_height + obj_camera.camera_height / 10)) 
	{
	instance_destroy(self, false);
}

// Destroy projectile if hp reduced to 0.
if (projectile_hp <= 0) {
	instance_destroy();
}