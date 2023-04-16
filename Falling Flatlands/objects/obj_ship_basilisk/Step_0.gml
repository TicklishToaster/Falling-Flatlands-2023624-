// Movement Controls //////////////////////////////////////////////////////////
#region
// Accelerate forwards.
if (input_up_hold) {
	// Add acceleration to motion.
	motion_add(image_angle, acceleration);
}

// Decelerate backwards.
if (input_down_hold) {
	// Determine a minimum value to decelerate the ship with.
	var reverse_speed = max(lerp(0, speed, 0.01), acceleration);
	
	// Decrease ship speed (minimum 0).
	speed = clamp(speed-reverse_speed, 0, speed);
}

// Gradually decelerate ship if no input is given.
if (!input_up_hold && !input_down_hold) {
	// Decrease ship speed (minimum 0).
	speed = clamp(speed-0.01, 0, speed);
}

// Rotate anti-clockwise.
if input_left_hold {
	image_angle += rotation_speed;
}

// Rotate clockwise.
if input_right_hold {
	image_angle -= rotation_speed;
}
#endregion

// Clamp maximum speed.
speed = clamp(speed, 0, max_speed);

// Weapon Controls ////////////////////////////////////////////////////////////
#region
// Switch to impact rocket.
if (input_key1_press) {
	rocket_type			= 1;
	projectile_damage	= 3;
	explosion_sprite_id = spr_explosion_effect_rocket1;
	audio_play_sound(SFX__ITB____Basilisk_Rocket_1, 10, false, 0.5);
}
// Switch to homing rocket.
if (input_key2_press) {
	rocket_type			= 2;		
	projectile_damage	= 2;
	explosion_sprite_id = spr_explosion_effect_rocket2;
	audio_play_sound(SFX__ITB____Basilisk_Rocket_2, 10, false, 0.5);
}
// Switch to blast rocket.
if (input_key3_press) {
	rocket_type			= 3;	
	projectile_damage	= 1;
	explosion_sprite_id = spr_explosion_effect_rocket3;
	audio_play_sound(SFX__ITB____Basilisk_Rocket_3, 10, false, 0.5);
}

//// Enable/disable rocket homing.
//if (input_control_press) {
//	homing_enabled = !homing_enabled;
//}
#endregion

#region
// Cycle through available targets upwards.
if (mouse_wheel_up() || input_uparrow_press) {
	// Find and store all enemies that are within range of the player.
	var targets_in_range = [];
	var range_modifier = 0.6;
	for (var i = 0; i < instance_number(obj_faction_enemy); i += 1) {
		var target_iteration = instance_find(obj_faction_enemy, i);
		if (point_in_rectangle(target_iteration.x, target_iteration.y,	
			self.x-Camera.camera_width*range_modifier, self.y-Camera.camera_height*range_modifier,
			self.x+Camera.camera_width*range_modifier, self.y+Camera.camera_height*range_modifier)) 
			{
			array_push(targets_in_range, target_iteration);
		}	
	}

	// Renew the target list with empty data.
	target_list = ds_grid_create(2, array_length(targets_in_range));
	
	// For each enemy object onscreen, add thier instance id and relative distance from the player.
	for (var i = 0; i < array_length(targets_in_range); i += 1) {
		var target_iteration = targets_in_range[i];		
		var taret_distance = point_distance(x, y, target_iteration.x, target_iteration.y);
		ds_grid_add(target_list, 0, i, target_iteration);
		ds_grid_add(target_list, 1, i, taret_distance);
	}
	
	// Sort target list in order from smallest distance to largest distance.
	ds_grid_sort(target_list, 1, true);
	
	// If a target was already set, calculate its new index so that the same target remains marked.
	for (var i = 0; i < ds_grid_height(target_list); i += 1) {
		if (ds_grid_get(target_list, 0, i) == projectile_target) {
			target_index = i;
		}
	}
	
	// If a target was already set but is now out of valid range, reset the current target to the nearest available enemy.
	if (instance_exists(projectile_target) && !point_in_rectangle(projectile_target.x, projectile_target.y,	
		self.x-Camera.camera_width*range_modifier, self.y-Camera.camera_height*range_modifier,
		self.x+Camera.camera_width*range_modifier, self.y+Camera.camera_height*range_modifier)) 
		{
		target_index	= 0;
		projectile_target = ds_grid_get(target_list, 0, target_index);
		crosshair_target_sprite_frame = 0;
	}
	
	// If no target is set, set target to the nearest available enemy.
	if (!instance_exists(projectile_target) && ds_grid_height(target_list) > 0) {
		target_index	= 0;
		projectile_target = ds_grid_get(target_list, 0, target_index);
		crosshair_target_sprite_frame = 0;
	}
	
	// Increment the target index, set the next projectile target, and reset the crosshair animation frame.
	target_index = clamp(target_index + 1, 0, ds_grid_height(target_list)-1);
	projectile_target = ds_grid_get(target_list, 0, target_index);
	crosshair_target_sprite_frame = 0;
}

// Cycle through available targets downwards.
if (mouse_wheel_down() || input_downarrow_press) {
	// Find and store all enemies that are within range of the player.
	var targets_in_range = [];
	var range_modifier = 0.6;
	for (var i = 0; i < instance_number(obj_faction_enemy); i += 1) {
		var target_iteration = instance_find(obj_faction_enemy, i);
		if (point_in_rectangle(target_iteration.x, target_iteration.y,	
			self.x-Camera.camera_width*range_modifier, self.y-Camera.camera_height*range_modifier,
			self.x+Camera.camera_width*range_modifier, self.y+Camera.camera_height*range_modifier)) 
			{
			array_push(targets_in_range, target_iteration);
		}	
	}

	// Renew the target list with empty data.
	target_list = ds_grid_create(2, array_length(targets_in_range));
	
	// For each enemy object onscreen, add thier instance id and relative distance from the player.
	for (var i = 0; i < array_length(targets_in_range); i += 1) {
		var target_iteration = targets_in_range[i];		
		var taret_distance = point_distance(x, y, target_iteration.x, target_iteration.y);
		ds_grid_add(target_list, 0, i, target_iteration);
		ds_grid_add(target_list, 1, i, taret_distance);
	}
	
	// Sort target list in order from smallest distance to largest distance.
	ds_grid_sort(target_list, 1, true);
	
	// If a target was already set, calculate its new index so that the same target remains marked.
	for (var i = 0; i < ds_grid_height(target_list); i += 1) {
		if (ds_grid_get(target_list, 0, i) == projectile_target) {
			target_index = i;
		}
	}
	
	// If a target was already set but is now out of valid range, reset the current target to the nearest available enemy.
	if (instance_exists(projectile_target) && !point_in_rectangle(projectile_target.x, projectile_target.y,	
		self.x-Camera.camera_width*range_modifier, self.y-Camera.camera_height*range_modifier,
		self.x+Camera.camera_width*range_modifier, self.y+Camera.camera_height*range_modifier)) 
		{
		target_index	= 0;
		projectile_target = ds_grid_get(target_list, 0, target_index);
		crosshair_target_sprite_frame = 0;
	}
	
	// If no target is set, set target to the nearest available enemy.
	if (!instance_exists(projectile_target) && ds_grid_height(target_list) > 0) {
		target_index	= 0;
		projectile_target = ds_grid_get(target_list, 0, target_index);
		crosshair_target_sprite_frame = 0;
	}
		
	// Decrement the target index, set the next projectile target, and reset the crosshair animation frame.
	target_index = clamp(target_index - 1, 0, ds_grid_height(target_list)-1);
	projectile_target = ds_grid_get(target_list, 0, target_index);
	crosshair_target_sprite_frame = 0;
}
#endregion

// Fire Ship Weapon.
#region
if (input_space_hold) {
	if (attack_cooldown == false) {
		if (rocket_type == 1 && attack_cooldown == false) {
			// Create rocket projectile and set attributes.
			with (instance_create_layer(x, y, "Instances", obj_rocket_basilisk)) {
				creator					= other;		
				faction					= other.faction;
				if (other.homing_enabled) {projectile_target = other.projectile_target;}
				rocket_type				= 1;
				projectile_hp			= other.projectile_hp;
				projectile_damage			= 3;
				knockback_send				= 3;
				projectile_speed_max		= 10.0;
				projectile_rotation_max		= 1.0;
				projectile_acceleration		= 0.05;
				projectile_sprite_id	= other.projectile_sprite_id;
				projectile_sprite_frame	= other.rocket_type-1;
				projectile_sprite_speed	= other.projectile_sprite_speed;
				projectile_sprite_colour= other.projectile_sprite_colour;
				explosion_sprite_id		= spr_explosion_effect_rocket1;
				explosion_sprite_speed	= other.projectile_explosion_sprite_speed;
				explosion_sprite_colour	= other.projectile_explosion_sprite_colour;
				sprite_index			= other.projectile_sprite_id;
				speed					= other.speed;				
				image_angle				= other.image_angle;
				direction				= other.image_angle;
				depth					= other.depth - 1;
			}
		}
	
		else if (rocket_type == 2 && attack_cooldown == false) {
			// Create rocket projectile and set attributes.
			with (instance_create_layer(x, y, "Instances", obj_rocket_basilisk)) {
				creator					= other;		
				faction					= other.faction;
				if (other.homing_enabled) {projectile_target = other.projectile_target;}
				rocket_type				= 2;
				projectile_hp			= other.projectile_hp;
				projectile_damage			= 2;
				knockback_send				= 2;
				projectile_speed_max		= 5.0;
				projectile_rotation_max		= 3.0;
				projectile_acceleration		= 0.03;
				projectile_sprite_id	= other.projectile_sprite_id;
				projectile_sprite_frame	= other.rocket_type-1;
				projectile_sprite_speed	= other.projectile_sprite_speed;
				projectile_sprite_colour= other.projectile_sprite_colour;
				explosion_sprite_id		= spr_explosion_effect_rocket2;
				explosion_sprite_speed	= other.projectile_explosion_sprite_speed;
				explosion_sprite_colour	= other.projectile_explosion_sprite_colour;
				sprite_index			= other.projectile_sprite_id;
				speed					= other.speed;				
				image_angle				= other.image_angle;
				direction				= other.image_angle;
				depth					= other.depth - 1;
			}
		}
	
		else if (rocket_type == 3 && attack_cooldown == false) {
			// Create rocket projectiles and set attributes.
			for (var i = -1; i < 2; ++i) {
				temp_target = ds_grid_get(target_list, 0, irandom_range(0, ds_grid_height(target_list)-1));
				with (instance_create_layer(
					x + lengthdir_x(16*i, direction+90), y + lengthdir_y(16*i, direction+90), 
					"Instances", obj_rocket_basilisk)) 
					{
					creator					= other;		
					faction					= other.faction;
					if (other.homing_enabled) {projectile_target = other.temp_target;}
					rocket_type				= 3;
					projectile_hp			= other.projectile_hp;
					projectile_damage			= 1;
					knockback_send				= 1;
					projectile_speed_max		= 5.0;
					projectile_rotation_max		= 3.0;
					projectile_acceleration		= 0.03;
					projectile_sprite_id	= other.projectile_sprite_id;
					projectile_sprite_frame	= other.rocket_type-1;
					projectile_sprite_speed	= other.projectile_sprite_speed;
					projectile_sprite_colour= other.projectile_sprite_colour;
					explosion_sprite_id		= spr_explosion_effect_rocket3;
					explosion_sprite_speed	= other.projectile_explosion_sprite_speed;
					explosion_sprite_colour	= other.projectile_explosion_sprite_colour;
					sprite_index			= other.projectile_sprite_id;
					speed					= other.speed;				
					image_angle				= other.image_angle;
					direction				= other.image_angle;
					depth					= other.depth - 1;
				}
			}
		}
		
		//else if (rocket_type == 3 && attack_cooldown == false) {
		//	// Create rocket projectile and set attributes.
		//	with (instance_create_layer(x, y, "Instances", obj_rocket_basilisk)) {
		//		creator					= other;		
		//		faction					= other.faction;
		//		if (other.homing_enabled) {projectile_target = other.projectile_target;}
		//		rocket_type				= 3;
		//		projectile_hp			= other.projectile_hp;
		//		projectile_damage			= 1;
		//		projectile_knockback		= 1;
		//		projectile_speed_max		= 5.0;
		//		projectile_rotation_max		= 3.0;
		//		projectile_acceleration		= 0.03;
		//		projectile_sprite_id	= other.projectile_sprite_id;
		//		projectile_sprite_frame	= other.rocket_type-1;
		//		projectile_sprite_speed	= other.projectile_sprite_speed;
		//		projectile_sprite_colour= other.projectile_sprite_colour;
		//		explosion_sprite_id		= spr_explosion_effect_rocket3;
		//		explosion_sprite_speed	= other.projectile_explosion_sprite_speed;
		//		explosion_sprite_colour	= other.projectile_explosion_sprite_colour;
		//		sprite_index			= other.projectile_sprite_id;
		//		speed					= other.speed;				
		//		image_angle				= other.image_angle;
		//		direction				= other.image_angle;
		//		depth					= other.depth - 1;
		//	}
		//}
		
		// Play shoot audio.
		audio_play_sound(SFX__FTL____Rocket_Shot__A_, 10, false);
			
		// Enable attack cooldown.
		attack_cooldown = true;		
	}
}
#endregion


// Shield Controls ////////////////////////////////////////////////////////////
#region
// Toggle Ship Shield
if (input_shift_hold) {
	if (shield_points > 0 && !shield_enabled) {
		shield_points -= 1;
		shield_enabled = true;
		audio_play_sound(SFX__FTL____Shield_On, 10, false);
	}
	
	// Play "Fail" audio if shield toggle is impossible.
	else if (input_shift_press) {
		audio_play_sound(SFX__FTL____Select_Fail_, 10, false);
	}
}
#endregion