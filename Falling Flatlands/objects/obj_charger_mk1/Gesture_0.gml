//// Inherit the parent event
//event_inherited();

//// Set default ship rotation and acceleration variables.
//var ship_rotation		= rotation_speed;
//var ship_acceleration	= acceleration;


////if (abs(new_angle) < 30 && attack_cooldown == false) {

////// Rotate ship toward the new angle at set rotation speed if player is in engagement range.
////if (abs(new_angle) < 30 && point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range) {
////	var ship_rotation		= rotation_speed;
////	var ship_acceleration	= acceleration;
////}

////// Rotate ship toward the new angle at set rotation speed x2 if player is out of engagement range.
////else if (abs(new_angle) > 30 && point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range) {
////	var ship_rotation		= rotation_speed*2;
////	var ship_acceleration	= acceleration;
////}

//if (!boosting) {
//	// Determine the angle required to face the target ship.
//	var new_angle = point_direction(x, y, obj_faction_player.x, obj_faction_player.y);
	
//	// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
//	new_angle = angle_difference(new_angle, image_angle);

//	//// Rotate ship towards new angle.
//	//image_angle += clamp(new_angle, -ship_rotation, ship_rotation);



//	if (abs(new_angle) < 30) {
//		ship_rotation		= rotation_speed;
//		ship_acceleration	= acceleration;
//	}
//	else if (abs(new_angle) > 30) {
//		ship_rotation		= rotation_speed*2;
//		ship_acceleration	= acceleration;	

//	}

//	// Rotate ship towards new angle.
//	image_angle += clamp(new_angle, -ship_rotation, ship_rotation);




//	//// Rotate ship toward the new angle if the  player is in engagement range.
//	//if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range) {
	
//	//	if (abs(new_angle) < 30) {
//	//		// Move toward the player if too far.
//	//		if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range {
//	//			// Apply acceleration to current motion.
//	//			motion_add(image_angle, ship_acceleration);	
//	//		}		
		
//	//		// Move away from the player if too close.
//	//		else if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range {
//	//			// Subtract acceleration from current motion.
//	//			motion_add(image_angle, -ship_acceleration);	
//	//		}
//	//	}
//	//}

//	// Rotate ship toward the new angle if the  player is in engagement range.
//	if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range) {
	
//		//speed = lerp(speed, 0, max_speed * 0.01);
//		speed = lerp(speed, 0, speed * 0.1);
	
//		if (abs(new_angle) < 5 && !charge_enable) {
//			charge_enable = true;
//			charge_timer = charge_timer_max;
//		}	
//	}

//	// Rotate ship toward the new angle if the player is in engagement range.
//	else if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range) {
//		// Apply acceleration to current motion.
//		motion_add(image_angle, ship_acceleration);	
//		speed = lerp(speed, max_speed/2, max_speed * 0.05);
	
//		//if (abs(new_angle) > 30) {
//		//	// Clamp Maximum Speed.
//		//	speed = clamp(speed, -max_speed/2, max_speed/2);
//		//}
	
//		//if (charge_enable) {
//		//	charge_enable = false;
//		//	charge_timer = charge_timer_max;		
//		//}	
//	}

//	//if (charge_enable) {
//	//	charge_timer = clamp(charge_timer - (room_speed / 60 / 60), 0, charge_timer_max);
//	//	if (charge_timer) <= 0 {
//	//		charge_complete = true;
//	//		charge_timer = charge_timer_max;
//	//	}
//	//}

//	//show_debug_message(charge_timer)

//	//// Rotate ship towards new angle.
//	//image_angle += clamp(new_angle, -ship_rotation, ship_rotation);

//	//// Rotate ship toward the new angle at set rotation speed x2 if player is out of engagement range.
//	//else if (abs(new_angle) > 30 && point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range) {
//	//	var ship_rotation		= rotation_speed*2;
//	//	var ship_acceleration	= acceleration;
	
//	//	if (abs(new_angle) < 30 && attack_cooldown == false) {
//	//		// Add Acceleration to Movement.
//	//		motion_add(image_angle, ship_acceleration);	
//	//	}	
//	//}

//	//// Rotate ship towards new angle.
//	//image_angle += clamp(new_angle, -ship_rotation, ship_rotation);

//	//show_debug_message(ship_rotation)


//	//if (abs(new_angle) < 30 && attack_cooldown == false) {
//	//	// Move away from the player if too close.
//	//	if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range/2 {
//	//		// Add Acceleration to Movement.
//	//		motion_add(image_angle, -ship_acceleration);	
//	//	}

//	//	// Move toward the player if too far.
//	//	else if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range/2 {
//	//		// Add Acceleration to Movement.
//	//		motion_add(image_angle, ship_acceleration);	
//	//	}
//	//}





//	// Perform a complex movement calculation when there are fewer instances of this object.
//	if (instance_number(obj_faction_enemy_hunter) < 64) {
//		// Push away from other enemy objects if too close.
//		for (var i = 0; i < instance_number(obj_faction_enemy); i += 1) {
//			var target_inst = instance_find(obj_faction_enemy, i);
//			if (target_inst == id) {
//				continue;
//			}
//			if (point_in_circle(target_inst.x, target_inst.y, x, y, proximity_radius)) {
//				var target_dir = point_direction(x, y, target_inst.x, target_inst.y);
//				motion_add(target_dir-180, acceleration);
//			}
//		}
//	}

//	// Instead perform a simple movement calculation when there are many instances of this object.
//	else {
//		// Push away from other enemy objects if too close.
//		if (instance_number(obj_faction_enemy) > 1) {
//			var target_inst = collision_circle(x, y, proximity_radius, obj_faction_enemy, false, true);
//			if (target_inst != -4 && point_in_circle(target_inst.x, target_inst.y, x, y, proximity_radius)) {
//				var target_dir = point_direction(x, y, target_inst.x, target_inst.y);
//				motion_add(target_dir-180, acceleration);
//			}
//		}
//	}
//}
//// Clamp Maximum Speed.
//speed = clamp(speed, -max_speed/2, max_speed);



//if (mouse_check_button(mb_left)) {
//	x = mouse_x;
//	y = mouse_y;
//}

////if (mouse_check_button(mb_right)) {
////    var _dir=random(360);
////    var _dist=100;
////    var _x=mouse_x+lengthdir_x(_dist,_dir);
////    var _y=mouse_y+lengthdir_y(_dist,_dir);
////    var _part_dir=point_direction(_x,_y,x,y);
////    //part_type_direction(part_type_charge, _part_dir,_part_dir,0,0);
////    part_particles_create(particle_system, _x,_y,part_type_charge,1);
////}
