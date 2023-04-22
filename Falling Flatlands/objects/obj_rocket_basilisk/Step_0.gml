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
	projectile_rotation	= clamp(projectile_rotation + (room_speed / 60 / 60) + rotation_offset, 0, projectile_rotation_max);
}

// Add acceleration to motion.
motion_add(image_angle, projectile_acceleration);

// Clamp maximum speed.
speed = clamp(speed, -projectile_speed_max, projectile_speed_max);