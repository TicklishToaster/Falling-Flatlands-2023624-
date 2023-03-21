// Input Variables ////////////////////////////////////////////////////////////
// Input WASD Controls
var input_up_press			= keyboard_check_pressed(ord("W"));
var input_up_hold			= keyboard_check(ord("W"));
var input_down_press		= keyboard_check_pressed(ord("S"));
var input_down_hold			= keyboard_check(ord("S"));
var input_left_press		= keyboard_check_pressed(ord("A"));
var input_left_hold			= keyboard_check(ord("A"));
var input_right_press		= keyboard_check_pressed(ord("D"));
var input_right_hold		= keyboard_check(ord("D"));

// Input Arrow Key Controls
var input_uparrow_press		= keyboard_check_pressed(vk_up);
var input_uparrow_hold		= keyboard_check(vk_up);
var input_downarrow_press	= keyboard_check_pressed(vk_down);
var input_downarrow_hold	= keyboard_check(vk_down);
var input_leftarrow_press	= keyboard_check_pressed(vk_left);
var input_leftarrow_hold	= keyboard_check(vk_left);
var input_rightarrow_press	= keyboard_check_pressed(vk_right);
var input_rightarrow_hold	= keyboard_check(vk_right);

// Input Mouse Controls
var input_mouse1_click		= mouse_check_button_pressed(mb_left);
var input_mouse1_hold		= mouse_check_button(mb_left);
var input_mouse1_release	= mouse_check_button_released(mb_left);
var input_mouse2_click		= mouse_check_button_pressed(mb_right);
var input_mouse2_hold		= mouse_check_button(mb_right);
var input_mouse2_release	= mouse_check_button_released(mb_right);
var input_mouse4_click		= mouse_check_button_pressed(mb_side1);
var input_mouse5_click		= mouse_check_button_pressed(mb_side2);
var input_mouse_wheelup		= mouse_wheel_up();
var input_mouse_wheeldown	= mouse_wheel_down();

// Input Space Bar Controls
var input_space_press		= keyboard_check_pressed(vk_space);
var input_space_hold		= keyboard_check(vk_space);
var input_space_release		= keyboard_check_released(vk_space);

// Input Miscellaneous Controls
var input_shift_press		= keyboard_check_pressed(vk_shift);
var input_shift_hold		= keyboard_check(vk_shift);
var input_control_press		= keyboard_check_pressed(vk_control);
var input_control_hold		= keyboard_check(vk_control);
var input_key1_press		= keyboard_check_pressed(ord("1"));
var input_key2_press		= keyboard_check_pressed(ord("2"));
var input_key3_press		= keyboard_check_pressed(ord("3"));

///////////////////////////////////////////////////////////////////////////////

// Movement Controls //////////////////////////////////////////////////////////
// Accelerate Forward.
if (input_up_hold) {
	// Add Acceleration to Movement.
	motion_add(image_angle, acceleration);
	
	// Particle FX.
	exhaust_counter++;
	if(exhaust_counter >= 4){
		exhaust_counter = 0;
		//var n1 = 0.15;
		var xx = x - lengthdir_x(sprite_height*0.2, image_angle);
		var yy = y - lengthdir_y(sprite_height*0.2, image_angle);
		//var xx2 = x - lengthdir_x(sprite_height*n1, image_angle);
		//var yy2 = y - lengthdir_y(sprite_height*n1, image_angle);
		with(obj_particles){
			//var n = 15;
			part_particles_create(particle_system, xx, yy+00, part_type_ship_exhaust_large, 1);
			//part_particles_create(particle_system, xx2+lengthdir_x(n, other.image_angle+90), yy2+lengthdir_y(n, other.image_angle+90), part_type_ship_exhaust_large, 1);
			//part_particles_create(particle_system, xx2-lengthdir_x(n, other.image_angle+90), yy2-lengthdir_y(n, other.image_angle+90), part_type_ship_exhaust_large, 1);
		}
	}
}

// Decelerate Backwards.
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


// Rotate Anti-Clockwise.
if input_left_hold {
	image_angle += rotation_speed;
}

// Rotate Ship Clockwise.
if input_right_hold {
	image_angle -= rotation_speed;
}

// Clamp Maximum Speed.
speed = clamp(speed, 0, max_speed);

// Wrap ship to oppisite side of map when out of bounds.
move_wrap(true, true, sprite_width/2); 


// Weapon Controls ////////////////////////////////////////////////////////////
if (input_key1_press) {
	rocket_type			= 1;
	projectile_damage	= 3;
	explosion_sprite_id = spr_explosion_effect_rocket1;
	audio_play_sound(SFX__ITB____Basilisk_Rocket_1, 10, false, 0.5);
}
		
if (input_key2_press) {
	rocket_type			= 2;		
	projectile_damage	= 2;
	explosion_sprite_id = spr_explosion_effect_rocket2;
	audio_play_sound(SFX__ITB____Basilisk_Rocket_2, 10, false, 0.5);
}
		
if (input_key3_press) {
	rocket_type			= 3;	
	projectile_damage	= 1;
	explosion_sprite_id = spr_explosion_effect_rocket3;
	audio_play_sound(SFX__ITB____Basilisk_Rocket_3, 10, false, 0.5);
}

// Loop through available targets.
if (input_control_press) {
	//// Set target index back to -1 if it has gone beyond the limits of target list.
	//if (target_index == ds_grid_height(target_list)-1) {
	//	target_index = -1;
	//}

	//// Increment the target index, set the next projectile target, and reset the crosshair animation frame.
	//target_index = clamp(target_index + 1, 0, ds_grid_height(target_list)-1);
	//projectile_target = ds_grid_get(target_list, 0, target_index);
	//crosshair_target_sprite_frame = 0;
	
	homing_enabled = !homing_enabled;
}

// Cycle through available targets upwards.
if (mouse_wheel_up() || input_uparrow_press) {
	// Find and store all enemies that are within range of the player.
	var targets_in_range = [];
	var range_modifier = 0.6;
	for (var i = 0; i < instance_number(obj_faction_enemy); i += 1) {
		var target_iteration = instance_find(obj_faction_enemy, i);
		if (point_in_rectangle(target_iteration.x, target_iteration.y,	
			self.x-obj_camera.camera_width*range_modifier, self.y-obj_camera.camera_height*range_modifier,
			self.x+obj_camera.camera_width*range_modifier, self.y+obj_camera.camera_height*range_modifier)) 
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
			show_debug_message("REDEFINE CURRENT TARGET")
		}
	}
	
	// If a target was already set but is now out of valid range, reset the current target to the nearest available enemy.
	if (instance_exists(projectile_target) && !point_in_rectangle(projectile_target.x, projectile_target.y,	
		self.x-obj_camera.camera_width*range_modifier, self.y-obj_camera.camera_height*range_modifier,
		self.x+obj_camera.camera_width*range_modifier, self.y+obj_camera.camera_height*range_modifier)) 
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
			self.x-obj_camera.camera_width*range_modifier, self.y-obj_camera.camera_height*range_modifier,
			self.x+obj_camera.camera_width*range_modifier, self.y+obj_camera.camera_height*range_modifier)) 
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
			show_debug_message("REDEFINE CURRENT TARGET")
		}
	}
	
	// If a target was already set but is now out of valid range, reset the current target to the nearest available enemy.
	if (instance_exists(projectile_target) && !point_in_rectangle(projectile_target.x, projectile_target.y,	
		self.x-obj_camera.camera_width*range_modifier, self.y-obj_camera.camera_height*range_modifier,
		self.x+obj_camera.camera_width*range_modifier, self.y+obj_camera.camera_height*range_modifier)) 
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

// Fire Ship Weapon.
if (input_space_hold) {
	if (attack_cooldown == false) {
		if (rocket_type == 1 && attack_cooldown == false) {
			// Create rocket projectile and set attributes.
			with (instance_create_layer(x, y, "Instances", obj_rocket_basilisk)) {	
				creator					= other;		
				faction					= other.faction;
				rocket_type				= 1;
				projectile_hp			= other.projectile_hp;
				projectile_damage		= 3;
				projectile_speed		= 6;
				projectile_knockback	= other.projectile_knockback;
				projectile_direction	= other.image_angle;
				projectile_sprite_id	= other.projectile_sprite_id;
				projectile_sprite_speed	= other.projectile_sprite_speed;
				projectile_sprite_colour= other.projectile_sprite_colour;
				explosion_sprite_id		= spr_explosion_effect_rocket1;
				explosion_sprite_speed	= other.projectile_explosion_sprite_speed;
				explosion_sprite_colour	= other.projectile_explosion_sprite_colour;
				sprite_index			= projectile_sprite_id;
				image_angle				= other.image_angle;
				speed					= 0;
				direction				= projectile_direction;
				depth					= other.depth - 1;
				if (other.homing_enabled) {
					projectile_target	= other.projectile_target;
				}
				projectile_rotation		= 1.0;
				projectile_acceleration	= 0.1;
				rocket_sprite_frame		= other.rocket_type-1;
				homing_increment		= 0;
			}
		}
	
		else if (rocket_type == 2 && attack_cooldown == false) {
			// Create rocket projectile and set attributes.
			with (instance_create_layer(x, y, "Instances", obj_rocket_basilisk)) {
				creator					= other;		
				faction					= other.faction;
				rocket_type				= 2;
				projectile_hp			= other.projectile_hp;
				projectile_damage		= 2;
				projectile_speed		= 2;
				projectile_knockback	= other.projectile_knockback;
				projectile_direction	= other.image_angle;
				projectile_sprite_id	= other.projectile_sprite_id;
				projectile_sprite_speed	= other.projectile_sprite_speed;
				projectile_sprite_colour= other.projectile_sprite_colour;
				explosion_sprite_id		= spr_explosion_effect_rocket2;
				explosion_sprite_speed	= other.projectile_explosion_sprite_speed;
				explosion_sprite_colour	= other.projectile_explosion_sprite_colour;
				sprite_index			= projectile_sprite_id;
				image_angle				= other.image_angle;
				speed					= 0.1;
				direction				= projectile_direction;
				depth					= other.depth - 1;
				if (other.homing_enabled) {
					projectile_target	= other.projectile_target;
				}
				projectile_acceleration = 0.1;
				rocket_sprite_frame		= other.rocket_type-1;
				homing_increment		= 1;
			}
		}
	
		else if (rocket_type == 3 && attack_cooldown == false) {
			// Create rocket projectile and set attributes.
			with (instance_create_layer(x, y, "Instances", obj_rocket_basilisk)) {	
				creator					= other;		
				faction					= other.faction;
				rocket_type				= 3;
				projectile_hp			= other.projectile_hp;
				projectile_damage		= 0;
				projectile_speed		= 2;
				projectile_knockback	= other.projectile_knockback;
				projectile_direction	= other.image_angle;
				projectile_sprite_id	= other.projectile_sprite_id;
				projectile_sprite_speed	= other.projectile_sprite_speed;
				projectile_sprite_colour= other.projectile_sprite_colour;
				explosion_sprite_id		= spr_explosion_effect_rocket3;
				explosion_sprite_speed	= other.projectile_explosion_sprite_speed;
				explosion_sprite_colour	= other.projectile_explosion_sprite_colour;
				sprite_index			= projectile_sprite_id;
				image_angle				= other.image_angle;
				speed					= 0.1;
				direction				= projectile_direction;
				depth					= other.depth - 1;
				if (other.homing_enabled) {
					projectile_target	= other.projectile_target;
				}
				projectile_acceleration = 0.1;
				rocket_sprite_frame		= other.rocket_type-1;
				homing_increment		= 1;
			}
		}
		
		// Play shoot audio.
		audio_play_sound(SFX__FTL____Rocket_Shot__A_, 10, false);
			
		// Enable attack cooldown.
		attack_cooldown = true;		
	}
}

// Shield Controls ////////////////////////////////////////////////////////////
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

// Check if shield should be recharging.
if (!shield_recharge && !shield_enabled && shield_points < shield_points_max) {
	shield_recharge = true;
}

// Countdown shield timer and check if shield duration complete.
if (shield_enabled) {
	shield_enabled_timer = clamp(shield_enabled_timer - (room_speed / 60) / 60, 0, shield_enabled_timer_max);
	if (shield_enabled_timer) <= 0 {
		shield_enabled = false;
		shield_enabled_timer = shield_enabled_timer_max;
		audio_play_sound(SFX__FTL____Shield_Off, 10, false);
	}
}

// Countdown shield recharge timer and check if shield should be recharged.
if (shield_recharge && !shield_enabled) {
	shield_recharge_timer = clamp(shield_recharge_timer - (room_speed / 60) / 60, 0, shield_recharge_timer_max);
	// Reset shield recharge timer if complete, increment shield points, and play shield audio.
	if (shield_recharge_timer) <= 0 {
		shield_recharge_timer = shield_recharge_timer_max;
		shield_points = clamp(shield_points + 1, 0, shield_points_max)
		audio_play_sound(SFX__FTL____Select_Down_, 10, false);
		
		// Stop recharging if shield points are at max and play special shield audio.
		if (shield_points >= shield_points_max) {
			shield_recharge = false;
			audio_stop_sound(SFX__FTL____Select_Down_);
			audio_play_sound(SFX__FTL____Select_Up_, 10, false);
		}
	}
}


// Invincibility Frames ///////////////////////////////////////////////////////
// Check if i-frames are enabled.
if (iframes_enabled) {
	// Countdown i-frames duration.
	iframes_timer = clamp(iframes_timer - (room_speed / 60) / 60, 0, iframes_timer_max);	
	
	// Increment i-frames blink value.
	iframes_blink += 1;
	
	// Blink ship sprite every quarter-second.
	if (iframes_blink % 15 == 0 || iframes_blink == 1) {
		switch (image_alpha) {
			case 0.5:
				image_alpha = 1.0;
				break;
			case 1.0:
				image_alpha = 0.5;
				break;
		}
	}

	// Reset i-frame variables when countdown complete.
	if (iframes_timer) <= 0 {
		iframes_enabled = false;
		iframes_timer = iframes_timer_max;
		iframes_blink = 0;
		image_alpha = 1.0;
	}	
}



//// Debug
//if (input_control_press) {
//	health_points -= 1;
//	//motion_set()
//}


//// Take damage if object is an enemy faction.
//if (input_uparrow_press && !iframes_enabled) {
//	// Cancel damage if shield is active.
//	if (shield_enabled) {
//		audio_play_sound(choose(
//		SFX__FTL____Shield_Hit_Impact__A_,
//		SFX__FTL____Shield_Hit_Impact__B_,
//		SFX__FTL____Shield_Hit_Impact__C_), 
//		10, false)	
//		exit;
//	}	
	
//	// Enable I-Frames.
//	iframes_enabled = true;
	
//	// Change health.
//	health_points -= 1;

//	// Play audio clip for taking damage.
//	audio_play_sound(SFX__ITB____Ship_Damage, 10, false);

//	// Play special audio clip if health is critical.
//	if (health_points == 1) {
//		audio_play_sound(UI__ITB____Critical_Health, 10, false);
//	}
//}
