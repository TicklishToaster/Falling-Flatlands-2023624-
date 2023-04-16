// Inherit the parent event
event_inherited();


//// Determine the angle required to face the target ship.
//var new_angle = point_direction(x, y, obj_faction_player.x, obj_faction_player.y);
	
//// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
//new_angle = angle_difference(new_angle, gun_angle);
	
//// Rotate ship gun toward new angle at set turn speed.
//gun_angle += clamp(new_angle, -rotation_speed, rotation_speed);


if (!teleport_cooldown) {
	teleport_cooldown = true;
	teleport_ring = true;
	//show_debug_message(gun_angles)
	//show_debug_message(gun_angles_previous)
	//gun_angles_previous = gun_angles;
	//show_debug_message("")
	//show_debug_message(gun_angles)
	//show_debug_message(gun_angles_previous)
	
	// Calculate a set of 8 new angles for each gun to point towards.
	var n = 15;
	for (var i = 0; i < array_length(gun_angles); i += 1) {
		gun_angles_previous[i] = gun_angles[i];
		gun_angles[i] = -64;
		while (gun_angles[i] == -64) {
			var invalid_angle = false;
			var new_angle = irandom_range(0, 359);
			
			// Ensure that each new gun angle is not within 15 degrees of another gun angle.
			for (var i2 = 0; i2 < array_length(gun_angles); i2 += 1) {
				if (new_angle >= gun_angles[i2] - n && new_angle <= gun_angles[i2] + n ) {
					if (gun_angles[i2] != -64) {
						invalid_angle = true;
						break;
					}
				}
			}
			
			if (!invalid_angle) {
				//var last_angle = gun_angles[i];
				//gun_angles_previous[i] = last_angle;
				gun_angles[i] = new_angle;
			}
		}
	}
	
	// Determine a range of positions in view of the camera.
	var border_x1 = uc_get_view_x() + sprite_width  / 2;
	var border_y1 = uc_get_view_y() + sprite_height / 2;
	var border_x2 = uc_get_view_x() - sprite_width  / 2 + Camera.camera_width;
	var border_y2 = uc_get_view_y() - sprite_height / 2 + Camera.camera_height;
	
	// Randomise a position in camera range to teleport to.
	teleport_x = irandom_range(border_x1, border_x2);
	teleport_y = irandom_range(border_y1, border_y2);
	
	// Ensure the teleport position does not overlap with an existing object.
	while (collision_rectangle(
		teleport_x-sprite_width/2, teleport_y-sprite_height/2, 
		teleport_x+sprite_width/2, teleport_y+sprite_height/2, 
		obj_faction, false, true)) 
		{
		teleport_x = irandom_range(border_x1, border_x2);
		teleport_y = irandom_range(border_y1, border_y2);		
	}
	
	// Set new teleport position.
	previous_x = x;
	previous_y = y;
	x = teleport_x;
	y = teleport_y;
	
	// Play shoot audio.
	audio_play_sound(SFX__FTL____Enemy_Teleport, 10, false, 0.5);	
}

if (!attack_cooldown && !teleport_fired) {
	teleport_fired = true;	
	for (var i = 0; i < array_length(gun_angles); i += 1) {
		var new_angle = gun_angles[i];
		with (instance_create_layer(x, y, "Instances", obj_projectile)) {
			creator					= other;		
			faction					= other.faction;
			projectile_hp			= other.projectile_hp;
			projectile_damage		= other.projectile_damage;
			projectile_speed		= other.projectile_speed;
			projectile_knockback	= other.projectile_knockback;
			projectile_direction	= new_angle;
			projectile_sprite_id	= other.projectile_sprite_id;
			projectile_sprite_speed	= other.projectile_sprite_speed;
			projectile_sprite_colour= other.projectile_sprite_colour;
			explosion_sprite_id		= other.projectile_explosion_sprite_id;
			explosion_sprite_speed	= other.projectile_explosion_sprite_speed;
			explosion_sprite_colour	= other.projectile_explosion_sprite_colour;
			sprite_index			= projectile_sprite_id;
			speed					= projectile_speed;
			direction				= projectile_direction;
			depth					= other.depth + 1;
		}
	}
	
	// Play shoot audio.
	audio_play_sound(choose(
	SFX__FTL____Energy_Shot_Heavy__A_,
	SFX__FTL____Energy_Shot_Heavy__B_,
	SFX__FTL____Energy_Shot_Heavy__C_), 
	10, false);
}


//// If player is in range.
//if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range) {	
//	// Fire Projectile
//	if (abs(new_angle) < 15 && attack_cooldown == false) {
//		// Create projectile and set attributes.	
//		with (instance_create_layer(x, y, "Instances", obj_projectile)) {
//			creator					= other;		
//			faction					= other.faction;
//			projectile_hp			= other.projectile_hp;
//			projectile_damage		= other.projectile_damage;
//			projectile_speed		= other.projectile_speed;
//			projectile_knockback	= other.projectile_knockback;
//			projectile_direction	= other.gun_angle;
//			projectile_sprite_id	= other.projectile_sprite_id;
//			projectile_sprite_speed	= other.projectile_sprite_speed;
//			projectile_sprite_colour= other.projectile_sprite_colour;
//			explosion_sprite_id		= other.projectile_explosion_sprite_id;
//			explosion_sprite_speed	= other.projectile_explosion_sprite_speed;
//			explosion_sprite_colour	= other.projectile_explosion_sprite_colour;
//			sprite_index			= projectile_sprite_id;
//			speed					= projectile_speed;
//			direction				= projectile_direction;
//			depth					= other.depth + 1;
//		}

//		// Play shoot audio.
//		audio_play_sound(choose(
//		SFX__FTL____Energy_Shot_Heavy__A_,
//		SFX__FTL____Energy_Shot_Heavy__B_,
//		SFX__FTL____Energy_Shot_Heavy__C_), 
//		10, false);
	
//		// Enable attack cooldown.
//		attack_cooldown = true;
//	}
	
//	// Clamp speed.
//	speed = clamp(speed, 0, 0);
//}

//// If player is out of range.
//else if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range) {
//	// Slowly move towards the player.
//	var new_direction = point_direction(x, y, obj_faction_player.x, obj_faction_player.y);
//	motion_add(new_direction, acceleration);
	
//	// Clamp speed.
//	speed = clamp(speed, -max_speed, max_speed);
//}





