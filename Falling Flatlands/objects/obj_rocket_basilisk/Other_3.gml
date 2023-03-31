/// @description OLD


////// Inherit the parent event
////event_inherited();


//// If a rocket target still exists.
//if (instance_exists(projectile_target)) {
//	// Determine the angle required to face the target instance.
//	var new_angle = point_direction(x, y, projectile_target.x, projectile_target.y);
	
//	// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
//	new_angle = angle_difference(new_angle, image_angle);

//	// Rotate the rocket toward the new angle and clamp it.
//	image_angle += clamp(new_angle, -projectile_rotation, projectile_rotation);
	
//	direction = image_angle;
	
//	// Increase the potential rotation speed of the rocket over time.
//	//projectile_rotation		= clamp(projectile_rotation + (room_speed / 60 / 60)*homing_increment, 0, 10);
//	projectile_rotation	= clamp(projectile_rotation + (room_speed / 60 / 60), 0, projectile_rotation_max);
	
//	//// Increase the lock-on strength of the rocket over time.	
//	//projectile_lock			= clamp(projectile_lock		+ (room_speed / 60 / 60), 0, 100);
	
//	//// Further direct the rocket movement towards the target using projectile lock.
//	//// This is done to improve the homing strength of the rocket over time to ensure it hits the target.
//	//motion_add(point_direction(x, y, projectile_target.x, projectile_target.y), projectile_lock / 100);
//}

//// Add Acceleration to Movement.
//motion_add(image_angle, projectile_acceleration);

//// Increase the potential rotation speed of the rocket over time.
////projectile_speed = clamp(projectile_speed + (room_speed / 60 / 120)*homing_increment, 0, 5);
////projectile_speed = clamp(projectile_speed + (room_speed / 60 / 60), 0, projectile_speed_max);
////show_debug_message("Speed   : " + string(projectile_speed))
//show_debug_message("Speed   : " + string(speed))
//show_debug_message("Rotation: " + string(projectile_rotation))
////show_debug_message(image_angle)
////show_debug_message(direction)
//show_debug_message("")

////// Clamp Maximum Speed.
////speed = clamp(speed, -projectile_speed_max/2, projectile_speed_max);

//speed = clamp(speed, -projectile_speed_max, projectile_speed_max);


////// Adjust Velocity ////////////////////////////////////////////////////////////
////#region
////// Lerp speed to upper/lower limits.
////if (speed > projectile_speed_max) {
////	speed = lerp(speed, projectile_speed_max, projectile_acceleration);
////}
////else if (speed < -projectile_speed_max) {
////	speed = lerp(speed, -projectile_speed_max, projectile_acceleration);
////}
////#endregion



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

////// If a rocket target still exists.
////if (instance_exists(projectile_target)) {
////	// Determine the angle required to face the target instance.
////	var new_angle = point_direction(x, y, projectile_target.x, projectile_target.y);
	
////	// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
////	new_angle = angle_difference(new_angle, image_angle);

////	// Rotate the rocket toward the new angle and clamp it.
////	image_angle += clamp(new_angle, -projectile_rotation, projectile_rotation);
	
////	// Increase the potential rotation speed of the rocket over time.
////	projectile_rotation = clamp(projectile_rotation + (room_speed / 60 / 60)*homing_increment, 0, 10);
	
////	// Increase the lock-on strength of the rocket over time.	
////	projectile_lock		= clamp(projectile_lock		+ (room_speed / 60 / 60), 0, 100);
	
////	// Further direct the rocket movement towards the target using projectile lock.
////	// This is done to improve the homing strength of the rocket over time to ensure it hits the target.
////	motion_add(point_direction(x, y, projectile_target.x, projectile_target.y), projectile_lock / 100);
////}

////// Add Acceleration to Movement.
////motion_add(image_angle, projectile_acceleration);

////// Increase the potential rotation speed of the rocket over time.
////projectile_speed = clamp(projectile_speed + (room_speed / 60 / 300)*homing_increment, 0, 5);

////// Clamp Maximum Speed.
////speed = clamp(speed, -projectile_speed/2, projectile_speed);
