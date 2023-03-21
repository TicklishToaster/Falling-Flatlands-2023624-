// Inherit the parent event
event_inherited();


// If a rocket target still exists.
if (instance_exists(projectile_target)) {
	// Determine the angle required to face the target instance.
	var new_angle = point_direction(x, y, projectile_target.x, projectile_target.y);
	
	// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
	new_angle = angle_difference(new_angle, image_angle);

	// Rotate the rocket toward the new angle and clamp it.
	image_angle += clamp(new_angle, -projectile_rotation, projectile_rotation);
	
	// Increase the potential rotation speed of the rocket over time.
	projectile_rotation = clamp(projectile_rotation + (room_speed / 60 / 60)*homing_increment, 0, 10);
	
	// Increase the lock-on strength of the rocket over time.	
	projectile_lock		= clamp(projectile_lock		+ (room_speed / 60 / 60), 0, 100);
	
	// Further direct the rocket movement towards the target using projectile lock.
	// This is done to improve the homing strength of the rocket over time to ensure it hits the target.
	motion_add(point_direction(x, y, projectile_target.x, projectile_target.y), projectile_lock/100);
}

// Add Acceleration to Movement.
motion_add(image_angle, projectile_acceleration);

// Increase the potential rotation speed of the rocket over time.
projectile_speed = clamp(projectile_speed + (room_speed / 60 / 300)*homing_increment, 0, 5);

// Clamp Maximum Speed.
speed = clamp(speed, -projectile_speed/2, projectile_speed);
