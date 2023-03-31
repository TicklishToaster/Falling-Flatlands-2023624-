// Movement Controls //////////////////////////////////////////////////////////
#region
if (!boost_mode) {
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
		image_angle += rotation_speed_default;
	}

	// Rotate clockwise.
	if input_right_hold {
		image_angle -= rotation_speed_default;
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
			max_speed = max_speed_boosted;

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
#endregion

// Booster Controls ///////////////////////////////////////////////////////////
#region
if (boost_mode) {
	// Set booster charge timer to a value proportional to the current ship speed.
	// This value is intended to decrease over time as the boost wears off and the ship slows down.
	booster_charge_timer = clamp((speed - max_speed_default)/(max_speed_default/2), 0, booster_charge_timer_max);

	// Gradually decelerate ship during boost mode.
	speed = clamp(speed-acceleration/4, 0, speed);		
		
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

	// Exit boost mode when speed dips below default maximum.
	if (speed <= max_speed_default) {
			boost_mode = false;
			max_speed = max_speed_default;
	}
}
#endregion

// Clamp maximum speed for default or boost mode.
speed = clamp(speed, 0, max_speed);

