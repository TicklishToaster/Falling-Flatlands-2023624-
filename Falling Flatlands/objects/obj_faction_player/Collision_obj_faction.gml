// Inherit the parent event
event_inherited();


// Exit if foreign object is part of the same faction.
if (other.faction == faction) {
	exit;
}

// Exit if current object is the Artemis, as it reacts differently to collisions.
if (ship_artemis) {
	exit;
}


// If the colliding object is hostile to current faction.
if (other.faction != faction) {
	// If collision damage cooldown is not active.
	if (!collision_damage_cooldown) {	
		// Nullify damage if shield is active.
		if (shield_enabled) {		
			// Append a boolean condition for later use.
			array_set(collision_detection_data[array_length(collision_detection_data)-1], 7, true);
		
			// Apply effects if shield effect cooldown is currently disabled.
			if (!shield_effect_cooldown) {
				// Set shield effect cooldown to true to prevent triggering on every frame.
				shield_effect_cooldown = true;			
			
				// Play shield impact audio.
				audio_play_sound(choose(
				SFX__FTL____Shield_Hit_Impact__A_,
				SFX__FTL____Shield_Hit_Impact__B_,
				SFX__FTL____Shield_Hit_Impact__C_), 
				10, false);
			}		
		
			// Call knockback event.
			event_user(1);
			
			// Exit event.
			exit;
		}
		
		// Nullify damage if i-frames are enabled.
		if (iframes_enabled) {
			// Call knockback event.
			event_user(1);			
		
			// Exit event.
			exit;		
		}
		
		// Apply damage and knockback.
		// Call damage event.
		take_damage = 1;
		event_user(0);
		
		// Call knockback event.
		event_user(1);
	}
}


//// If the colliding projectile is hostile to own faction.
//if (other.faction != faction && !collision_damage_cooldown) {	
//	// If the shield is enabled, append a boolean condition to the end of the collision entry array.
//	if (shield_enabled) {
//		array_set(collision_detection_data[array_length(collision_detection_data)-1], 6, true);
//	}	
	
//	// Nullify damage if shield is active.
//	if (shield_enabled & !shield_effect_cooldown) {
//		// Set shield effect cooldown to true to prevent it triggering on every frame.
//		shield_effect_cooldown = true;
		
//		// Play shield impact audio.
//		audio_play_sound(choose(
//		SFX__FTL____Shield_Hit_Impact__A_,
//		SFX__FTL____Shield_Hit_Impact__B_,
//		SFX__FTL____Shield_Hit_Impact__C_), 
//		10, false);
		
//		// Apply knockback to this object using its knockback modifier with the colliding object.
//		// This assumes that 2 non-projectile objects collided and should be knocked away from each other.
//		if (knockback_modifier != 0) {	
//			// Ignore knockback if colliding object is unique.
//			if (!object_is_ancestor(other.object_index, obj_faction_enemy_swarmer)) {
//				motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed/2, 1));
//			}
//		}
		
//		// Apply knockback to this object using its knockback modifier with the colliding object.
//		// This assumes that 2 non-projectile objects collided and should be knocked away from each other.
//		if (knockback_modifier != 0) {	
//			// Ignore knockback if colliding object is unique.
//			if (!object_is_ancestor(other.object_index, obj_faction_enemy_swarmer)) {
//				motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed/2, 1));
//			}
//		}
		
//		// Exit event.
//		exit;
//	}
	
//	// Nullify damage if i-frames are enabled.
//	if (iframes_enabled) {
//		// Apply knockback to this object using its knockback modifier with the colliding object.
//		// This assumes that 2 non-projectile objects collided and should be knocked away from each other.
//		if (knockback_modifier != 0) {	
//			// Ignore knockback if colliding object is unique.
//			if (!object_is_ancestor(other.object_index, obj_faction_enemy_swarmer)) {
//				motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed/2, 1));
//			}
//		}
		
//		// Exit event.
//		exit;		
//	}

//	// Apply damage/knockback if i-frames are disabled and shield is not active.
//	if (!iframes_enabled && !shield_enabled) {
//		// Deduct 1 from health points.
//		health_points -= 1;
		
//		// Enable I-Frames.
//		iframes_enabled = true;
		
//		// Set collision damage cooldown to true to prevent damage on every frame.
//		collision_damage_cooldown = true;

//		// Play audio clip for taking damage.
//		if (health_points > 1) {
//			audio_play_sound(SFX__ITB____Ship_Damage, 10, false);
//		}

//		// Play special audio clip if health is critical.
//		if (health_points == 1) {
//			audio_play_sound(UI__ITB____Critical_Health, 10, false);
//		}
		
//		// Apply knockback to this object using its knockback modifier with the colliding object.
//		// This assumes that 2 non-projectile objects collided and should be knocked away from each other.
//		if (knockback_modifier != 0) {	
//			// Ignore knockback if colliding object is unique.
//			if (!object_is_ancestor(other.object_index, obj_faction_enemy_swarmer)) {
//				motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed/2, 1));
//			}
//		}
		
//		// Trigger hit and flash camera functions.
//		uc_hit(collision_detection_data[array_length(collision_detection_data)-1][2]-180, 1, 0.1);
//		uc_flash(c_red, [0.4, 0.1], 0.2);
//	}
//}