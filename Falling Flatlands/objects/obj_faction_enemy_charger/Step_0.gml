// Inherit the parent event
event_inherited();


// Set default ship rotation and acceleration variables.
var ship_rotation		= rotation_speed;
var ship_acceleration	= acceleration;


if (!boosting) {
	// Determine the angle required to face the target ship.
	var new_angle = point_direction(x, y, obj_faction_player.x, obj_faction_player.y);
	
	// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
	new_angle = angle_difference(new_angle, image_angle);

	// Rotate ship towards new angle.
	image_angle += clamp(new_angle, -ship_rotation, ship_rotation);

	// If player is within enagement range.
	if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) <= engagement_range) {
		// Slowdown to a halt when charging.
		if (charge_enable) {
			speed = lerp(speed, 0, max(speed * 0.1, max_speed_default*0.01));
		}		
		
		// Start charging if facing the player and attack cooldown is complete.
		if (!charge_enable && attack_cooldown_timer <= 0) {
			if (abs(new_angle) < 5) {
				charge_enable = true;
				charge_timer = charge_timer_max;
			}
		}
	}

	// If player is outside of enagement range.
	else if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range) {
		if (charge_enable) {
			// Slowdown to a halt when charging.
			speed = lerp(speed, 0, max(speed * 0.1, max_speed_default*0.01));
		}
		
		if (!charge_enable) {
			// Apply acceleration to current motion.
			motion_add(image_angle, ship_acceleration);
		}
	}

	// Move toward the player if too far.
	if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range/2 {
		// Apply acceleration to current motion.
		motion_add(image_angle, ship_acceleration/4);	
	}

	// Move away from the player if too close.
	else if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range/2 {
		// Subtract acceleration from current motion.
		motion_add(image_angle, -ship_acceleration);	
	}

	#region
	// Perform a complex movement calculation when there are fewer instances of this object.
	if (instance_number(obj_faction_enemy_hunter) < 64) {
		// Push away from other enemy objects if too close.
		for (var i = 0; i < instance_number(obj_faction_enemy); i += 1) {
			var target_inst = instance_find(obj_faction_enemy, i);
			if (target_inst == id) {
				continue;
			}
			if (point_in_circle(target_inst.x, target_inst.y, x, y, proximity_radius)) {
				var target_dir = point_direction(x, y, target_inst.x, target_inst.y);
				motion_add(target_dir-180, acceleration);
			}
		}
	}

	// Instead perform a simple movement calculation when there are many instances of this object.
	else {
		// Push away from other enemy objects if too close.
		if (instance_number(obj_faction_enemy) > 1) {
			var target_inst = collision_circle(x, y, proximity_radius, obj_faction_enemy, false, true);
			if (target_inst != -4 && point_in_circle(target_inst.x, target_inst.y, x, y, proximity_radius)) {
				var target_dir = point_direction(x, y, target_inst.x, target_inst.y);
				motion_add(target_dir-180, acceleration);
			}
		}
	}
	#endregion
}


// Countdown attack cooldown.
if (attack_cooldown) {
	attack_cooldown_timer = clamp(attack_cooldown_timer - (room_speed / 60 / 60), 0, attack_cooldown_timer_max);
	if (attack_cooldown_timer) <= 0 {
		attack_cooldown = false;
	}
}

// Countdown charge timer.
if (charge_enable) {
	charge_timer = clamp(charge_timer - (room_speed / 60 / 60), 0, charge_timer_max);
	if (charge_timer) <= 0 {
		charge_complete = true;
	}
}

// Toggle boost mode.
if (charge_enable && charge_complete) {
	// Set boost/charge variables.
	boosting = true;
	charge_enable = false;
	charge_complete = false;
	charge_timer = charge_timer_max;
	knockback_send = 2;
	knockback_take = 0;
		
	// Reset and apply new motion to the ship.
	motion_set(image_angle, max(0.1, speed));
	motion_add(image_angle, max_speed_boosted);
			
	// Play audio clip
	audio_play_sound(SFX__ITB____Artemis_Launch_Normal, 10, false, 0.5);
}

// Disable boosting and reset variables if boosted timer is 0.
if (boosting) {
	boosted_timer = clamp(boosted_timer - (room_speed / 60 / 60), 0, boosted_timer_max);
	if (boosted_timer) <= 0 {
		// Set boost/charge variables.
		boosting = false;
		boosted_timer = boosted_timer_max;
		attack_cooldown = true;
		attack_cooldown_timer = attack_cooldown_timer_max;
		knockback_send = 1;
		knockback_take = 1;
		speed = clamp(speed, -max_speed, max_speed);
	}
}