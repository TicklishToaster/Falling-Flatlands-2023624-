// Inherit the parent event
event_inherited();

//////////////////////////////////////////////////////////////////////////////////////////////////
// If the colliding projectile is hostile to own faction.
if (other.faction != faction) {	
	// Nullify damage/knockback if collision with this object has already occured.
	if (other == last_collider) {
		// Exit event.
		exit;
	}	
	
	// Set projectile as the most recent collider.
	last_collider = other;
	collider_timer = 20;
	
	// Apply increased damage to the colliding object based on the current speed of the Artemis.	
	if (boost_mode) {
		if (speed >= max_speed_default * 1.75) {
			// Apply damage to collided object.		
			with (other) {
				// Apply damage and knockback.
				// Call damage event.
				take_damage = 6;
				event_user(0);		
			}
		
			// Play audio clip impact type C.
			audio_stop_sound(SFX__ITB____Artemis_Impact__C_);
			audio_play_sound(SFX__ITB____Artemis_Impact__C_, 10, false, 0.5);
		}
		else if (speed >= max_speed_default * 1.50) {
			// Apply damage to collided object.		
			with (other) {
				// Apply damage and knockback.
				// Call damage event.
				take_damage = 4;
				event_user(0);		
			}
		
			// Play audio clip impact type B.
			audio_stop_sound(SFX__ITB____Artemis_Impact__B_);
			audio_play_sound(SFX__ITB____Artemis_Impact__B_, 10, false, 0.5);		
		}
		else if (speed >= max_speed_default * 1.25) {
			// Apply damage to collided object.		
			with (other) {
				// Apply damage and knockback.
				// Call damage event.
				take_damage = 2;
				event_user(0);		
			}
		
			// Play audio clip impact type A.
			audio_stop_sound(SFX__ITB____Artemis_Impact__A_);
			audio_play_sound(SFX__ITB____Artemis_Impact__A_, 10, false, 0.5);	
		}
		else if (speed > max_speed_default) {
			// Apply damage to collided object.		
			with (other) {
				// Apply damage and knockback.
				// Call damage event.
				take_damage = 1;
				event_user(0);		
			}
		
			// Play audio clip impact type A.
			audio_stop_sound(SFX__ITB____Artemis_Impact__A_);
			audio_play_sound(SFX__ITB____Artemis_Impact__A_, 10, false, 0.5);	
		}
		
		// Decrease ship speed when it hits an object.
		//speed = clamp(speed-acceleration*10, 0, speed);
		speed = clamp(speed-(max_speed_boosted-max_speed_default)/8, max_speed_default * 1.2, speed);
	}
	else if (speed == max_speed_default) {
		// Apply damage to collided object.		
		with (other) {
			// Apply damage and knockback.
			// Call damage event.
			take_damage = 1;
			event_user(0);		
		}
		
		// Play audio clip impact type A.
		audio_stop_sound(SFX__ITB____Artemis_Impact__A_);
		audio_play_sound(SFX__ITB____Artemis_Impact__A_, 10, false, 0.5);
	}
	
	//// Check if collision will destroy the enemy.
	//if (other.health_points <= 0 || other.health_points-1 <= 0) {
	//	// Heal 1 hit point if current health points are below the maximum.
	//	if (health_points < health_points_max) {
	//		health_points = clamp(health_points + 1, 0, health_points_max);
		
	//		// Play audio clip for restoring health.
	//		audio_play_sound(UI__ITB____Health_Powerup, 10, false);
			
	//		// Trigger hit and flash camera functions.
	//		uc_flash(c_fuchsia, [0.4, 0.1], 0.2);			
	//	}
	//}
}



//////////////////////////////////////////////////////////////////////////////////////////////////
// If the colliding object is hostile to own faction and is capable of damaging the artemis.
if (other.faction != faction) {
	// Exit if collision damage is on cooldown.
	if (collision_damage_cooldown) {
		exit;
	}
	
	// Apply collision damage/knockback to self if the colliding object is a boosting enemy charger.
	if (object_is_ancestor(other.object_index, obj_faction_enemy_charger)) {
		if (other.boosting == true) {
			// Apply damage and knockback to self.
			// Call damage event.
			take_damage = 1;
			event_user(0);
			
			// Call knockback event.
			event_user(1);
		}
		// Set collision damage cooldown to true to prevent damage on every frame.
		collision_damage_cooldown = true;		
	}
	
	// Apply collision damage to self if the colliding object is a swarmer.
	if (object_is_ancestor(other.object_index, obj_faction_enemy_swarmer)) {
		if (speed <= max_speed_default) {
			// Apply damage and knockback to self.
			// Call damage event.
			take_damage = 1;
			event_user(0);
			
			// Call knockback event.
			event_user(1);	
		}
		// Set collision damage cooldown to true to prevent damage on every frame.
		collision_damage_cooldown = true;	
	}
	
	// Apply knockback if colliding object is stationary.
	if (other.knockback_take == 0) {
		// Call knockback event.
		event_user(1);
	}	
}