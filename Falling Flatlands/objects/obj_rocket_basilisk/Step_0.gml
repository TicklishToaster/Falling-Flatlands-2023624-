// If a rocket target still exists.
if (instance_exists(projectile_target)) {
	// Determine the angle required to face the target instance.
	var new_angle = point_direction(x, y, projectile_target.x, projectile_target.y);
	
	// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
	new_angle = angle_difference(new_angle, image_angle);

	// Rotate the rocket toward the new angle and clamp it.
	image_angle += clamp(new_angle, -projectile_rotation, projectile_rotation);
	
	// Force the rocket to only move in the direction it is facing.
	direction = image_angle;
	
	// Increase the potential rotation speed of the rocket over time.
	projectile_rotation	= clamp(projectile_rotation + (room_speed / 60 / 60), 0, projectile_rotation_max);
}

// Add acceleration to motion.
motion_add(image_angle, projectile_acceleration);

// Clamp maximum speed.
speed = clamp(speed, -projectile_speed_max, projectile_speed_max);


//// Destroy projectile if it goes beyond the camera boundaries.
//var border_x1 = uc_get_view_x() - Camera.camera_width  / 2;
//var border_y1 = uc_get_view_y() - Camera.camera_height / 2;
//var border_x2 = uc_get_view_x() + Camera.camera_width  / 2 + Camera.camera_width;
//var border_y2 = uc_get_view_y() + Camera.camera_height / 2 + Camera.camera_height;
//if (!point_in_rectangle(x, y, border_x1, border_y1, border_x2, border_y2)) {
//	instance_destroy(self, false);
//}


//// Destroy projectile if hp reduced to 0.
//if (projectile_hp <= 0) {
//	instance_destroy();
//}

