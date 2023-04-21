// Default Heal
if (other.powerup_type == 1) {
	// Heal 1 hit point if current health points are below the maximum.
	if (health_points < health_points_max) {
		health_points = clamp(health_points + 1, 0, health_points_max);
		
		// Play audio clip for restoring health.
		audio_stop_sound(UI__ITB____Health_Powerup);
		audio_play_sound(UI__ITB____Health_Powerup, 10, false);
			
		// Trigger flash camera function.
		uc_flash(c_fuchsia, [0.4, 0.1], 0.2);			
	}
}

// Powerup Heal
else if (other.powerup_type == 2) {
	health_points_max = clamp(health_points_max + 1, 0, 10);
	if (health_points < health_points_max) {
		health_points = clamp(health_points + 2, 0, health_points_max);
		
		// Play audio clip for restoring health.
		audio_stop_sound(UI__ITB____Health_Powerup);
		audio_play_sound(UI__ITB____Health_Powerup, 10, false);
			
		// Trigger flash camera function.
		uc_flash(c_fuchsia, [0.4, 0.1], 0.2);			
	}
}

// Powerup Rapid
else if (other.powerup_type == 3) {
	attack_cooldown_timer_max = clamp(attack_cooldown_timer_max - 0.1, 0.1, 0.5);	
	if (health_points < health_points_max) {
		health_points = clamp(health_points + 1, 0, health_points_max);
	}
	
	// Play audio clip for restoring health.
	audio_stop_sound(UI__ITB____Rapid_Powerup);
	audio_play_sound(UI__ITB____Rapid_Powerup, 10, false);
			
	// Trigger flash camera function.
	uc_flash(c_orange, [0.4, 0.1], 0.2);
}

// Powerup Spread
else if (other.powerup_type == 4) {
	attack_spread = clamp(attack_spread + 2, 1, 9);
	if (health_points < health_points_max) {
		health_points = clamp(health_points + 1, 0, health_points_max);
	}	
	
	// Play audio clip for restoring health.
	audio_stop_sound(UI__ITB____Spread_Powerup);
	audio_play_sound(UI__ITB____Spread_Powerup, 10, false);
			
	// Trigger flash camera function.
	uc_flash(c_orange, [0.4, 0.1], 0.2);
}

// Destroy powerup.
instance_destroy(other);
