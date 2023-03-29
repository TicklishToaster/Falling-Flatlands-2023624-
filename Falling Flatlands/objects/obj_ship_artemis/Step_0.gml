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
var input_mouse4_hold		= mouse_check_button(mb_side1);
var input_mouse5_click		= mouse_check_button_pressed(mb_side2);
var input_mouse5_hold		= mouse_check_button(mb_side2);

// Input Space Bar Controls
var input_space_press		= keyboard_check_pressed(vk_space);
var input_space_hold		= keyboard_check(vk_space);
var input_space_release		= keyboard_check_released(vk_space);

// Input Miscellaneous Controls
var input_shift_press		= keyboard_check_pressed(vk_shift);
var input_shift_hold		= keyboard_check(vk_shift);
var input_shift_release		= keyboard_check_released(vk_shift);
var input_control_press		= keyboard_check_pressed(vk_control);
var input_control_hold		= keyboard_check(vk_control);

///////////////////////////////////////////////////////////////////////////////

// Movement Controls //////////////////////////////////////////////////////////
if (!boost_mode) {
	if (!grapple_mode) {
		// Accelerate Forward.
		if (input_up_hold) {
			// Add Acceleration to Movement.
			motion_add(image_angle, acceleration);
	
			// Particle FX.
			exhaust_counter++;
			if(exhaust_counter >= 4){
				exhaust_counter = 0;
				var xx = x - lengthdir_x(sprite_height*0.2, image_angle);
				var yy = y - lengthdir_y(sprite_height*0.2, image_angle);
				with(obj_particles){
					part_particles_create(particle_system, xx, yy, part_type_ship_exhaust_large, 1);
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
			image_angle += rotation_speed_default;
		}

		// Rotate Ship Clockwise.
		if input_right_hold {
			image_angle -= rotation_speed_default;
		}
	}
	
	
	// Enable boost charge.
	if (input_shift_hold) {
		if (!booster_charge_enable) {
			booster_charge_enable = true;
			
			// Play audio clip for starting charge.
			audio_play_sound(SFX__ITB____Artemis_Charge_Pulse_Start, 10, false, 0.5);			
		}
	
		// Countdown booster charge.
		if (booster_charge_enable && !booster_charge_complete) {
			booster_charge_timer = clamp(booster_charge_timer + (room_speed / 60 / 60), 0, booster_charge_timer_max);
			
			// Toggle booster charge as complete.
			if (booster_charge_timer >= booster_charge_timer_max && !booster_charge_complete) {
				booster_charge_complete = true;
				
				// Play audio clip for completing charge.
				audio_play_sound(SFX__ITB____Artemis_Charge_Pulse__D_, 10, false, 0.5);				
			}		
		}
	}
	
	// Cancel boost charge.
	if (!input_shift_hold) {
		if (booster_charge_enable && booster_charge_timer < booster_charge_timer_max/4) {			
			booster_charge_timer = clamp(booster_charge_timer - (room_speed / 60 / 60), 0, booster_charge_timer_max);
			if (booster_charge_timer <= 0) {
				booster_charge_enable = false;
			}
		}
	}	
	
	// Release boost charge.
	if (input_shift_release) {
		// If the booster charge timer is above the minimum threshold.
		if (booster_charge_enable && booster_charge_timer >= booster_charge_timer_max/4) {
			// Set booster variables.
			booster_charge_enable = false;
			boost_mode = true;
			max_speed_current = max_speed_boosted;

			// Reset and apply new motion to the ship.
			motion_set(image_angle, max(0.1, speed));
			motion_add(image_angle, speed * booster_charge_timer);
			speed = clamp(max_speed_default + (max_speed_default * booster_charge_timer/booster_charge_timer_max), 0, max_speed_boosted);
			
			// Play audio clip for launching when below full charge. 
			if (!booster_charge_complete) {
				audio_play_sound(SFX__ITB____Artemis_Launch_Normal, 10, false, 0.5);
			}
			
			// Play audio clip for launching when at full charge. 
			if (booster_charge_complete) {				
				audio_play_sound(SFX__ITB____Artemis_Launch_Charged, 10, false, 0.5);
				
				// Toggle charge complete to false.
				booster_charge_complete = false;
			}
		}
	}
}

// Booster Controls ///////////////////////////////////////////////////////////
if (boost_mode) {
	//// Gradually decelerate ship during boost mode.
	//speed = clamp(speed-acceleration/4, 0, speed);

	// Set booster charge timer to a value proportional to the current ship speed.
	// This value is intended to decrease over time as the boost wears off and the ship slows down.
	booster_charge_timer = clamp((speed - max_speed_default)/(max_speed_default/2), 0, booster_charge_timer_max);
	
	if (!grapple_mode) {
		// Gradually decelerate ship during boost mode.
		speed = clamp(speed-acceleration/4, 0, speed);		
		
		// Particle FX.
		exhaust_counter++;
		if (exhaust_counter >= 2){
			exhaust_counter = 0;
			var xx = x - lengthdir_x(sprite_height*0.2, image_angle);
			var yy = y - lengthdir_y(sprite_height*0.2, image_angle);
			with(obj_particles){
				part_particles_create(particle_system, xx, yy, part_type_ship_exhaust_large, 1);
			}
		}
	
		// Further decelerate ship during boost mode.
		if (input_shift_hold || input_down_hold) {
			speed = clamp(speed-acceleration, 0, speed);
		}

		// Rotate and angle the ship clockwise to slowly adjust its direction at high speeds.
		if (input_left_hold) {
			if (boost_mode) {
				image_angle += rotation_speed_boosted;
				motion_set(image_angle, speed);
			}
		}
	
		// Rotate and angle the ship anti-clockwise to slowly adjust its direction at high speeds.
		if (input_right_hold) {
			if (boost_mode) {
				image_angle -= rotation_speed_boosted;
				motion_set(image_angle, speed);
			}
		}
	}

	// Exit boost mode when speed dips below default maximum.
	if (speed <= max_speed_default) {
			boost_mode = false;
			max_speed_current = max_speed_default;
	}
}

// Clamp maximum speed for default or boost mode.
speed = clamp(speed, 0, max_speed_current);



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


//// Grapple Controls ///////////////////////////////////////////////////////////

//// Grapple Create
//if (input_space_press) {
//	if (!grapple_mode && instance_exists(grapple_target)) {
//		grapple_mode = true;
//		grapple_length	= point_distance(x, y, grapple_target.x, grapple_target.y) * -1;
//		grapple_angle	= point_direction(x, y, grapple_target.x, grapple_target.y);
		
//		// Store direction the ship should face (clockwis/anti-clockwise).
//		if (angle_difference(grapple_angle, image_angle) > 0) {
//			grapple_orient = -1;
//		} 
//		else {
//			grapple_orient = 1;
//		}
		
//		// Play audio clip for launching when at full charge. 
//		audio_play_sound(SFX__ITB____Artemis_Grapple_On, 10, false);	
//	}
//}

//// Grapple Destroy
//if (input_space_release) {
//	if (grapple_mode && instance_exists(grapple_target)) {
//		grapple_mode = false;
//		motion_set(image_angle, speed);
		
//		// Play audio clip for launching when at full charge.
//		audio_play_sound(SFX__ITB____Artemis_Grapple_Off, 10, false);	
//	}
//}

//if (grapple_mode && !instance_exists(grapple_target)) {
//	grapple_mode = false;
//	motion_set(image_angle, speed);
	
//	// Play audio clip for launching when at full charge.
//	audio_play_sound(SFX__ITB____Artemis_Grapple_Off, 10, false);
//}


//if (grapple_mode && instance_exists(grapple_target)) {
//	// Set the creator object's orbital position relative to the distance between the creator and the target.
//	x = grapple_target.x + lengthdir_x(grapple_length, grapple_angle);
//	y = grapple_target.y + lengthdir_y(grapple_length, grapple_angle);
	
//	// Set a new orbital angle for the code above. Incremented using the creator's current speed.
//	// Orbital Formula: 360 / (2*pi*r/v) = 360 Degrees / (2pi * Radius / Velocity).
//	grapple_angle += 360/(2*pi*grapple_length/speed) * grapple_orient;

//	// Set the creator object direction to be perpendicular to the target object.
//	image_angle = grapple_angle + 90 * grapple_orient;
	
//	if (!boost_mode) { 
//		// Allow the creator object to increase thier speed while grappled.
//		if (input_up_hold) {
//			speed = clamp(speed+acceleration/4, 0, max_speed_current);	
//		}
	
//		if (input_down_hold) {
//			speed = clamp(speed-acceleration/4, 0, max_speed_current);	
//		}
//	}
	
//	var min_dist = -64;
//	var max_dist = -192;
//	// Decrease the grapple length.
//	if (input_mouse4_hold) {
//		grapple_length = clamp(grapple_length + 2, max_dist, min_dist);
//		show_debug_message(grapple_length)
//	}
//	// Increase the grapple length.
//	if (input_mouse5_hold) {
//		grapple_length = clamp(grapple_length - 2, max_dist, min_dist);
//	}
//} 