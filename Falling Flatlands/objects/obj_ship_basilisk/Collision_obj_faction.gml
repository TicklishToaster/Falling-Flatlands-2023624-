// Inherit the parent event
event_inherited();


// If the colliding projectile is hostile to own faction.
if (other.faction != faction) {	
	// Nullify damage if shield is active.
	if (shield_enabled) {
		// Play shield impact audio.
		audio_play_sound(choose(
		SFX__FTL____Shield_Hit_Impact__A_,
		SFX__FTL____Shield_Hit_Impact__B_,
		SFX__FTL____Shield_Hit_Impact__C_), 
		10, false);
		
		// Apply knockback to this object using its knockback modifier with the colliding object.
		// This assumes that 2 non-projectile objects collided and should be knocked away from each other.
		if (other.knockback_modifier == 0) {
			motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed/2, 1));
		}
		
		// Exit event.
		exit;
	}
	
	// Nullify damage if i-frames are enabled.
	if (iframes_enabled) {
		// Apply knockback to this object using its knockback modifier with the colliding object.
		// This assumes that 2 non-projectile objects collided and should be knocked away from each other.
		if (other.knockback_modifier == 0) {
			motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed/2, 1));
		}
		
		// Exit event.
		exit;		
	}	

	// Apply damage/knockback if i-frames are disabled and shield is not active.
	if (!iframes_enabled && !shield_enabled) {
		// Deduct 1 from health points.
		health_points -= 1;
		
		// Enable I-Frames.
		iframes_enabled = true;

		// Play audio clip for taking damage.
		if (health_points > 1) {
			audio_play_sound(SFX__ITB____Ship_Damage, 10, false);
		}

		// Play special audio clip if health is critical.
		if (health_points == 1) {
			audio_play_sound(UI__ITB____Critical_Health, 10, false);
		}
		
		// Apply knockback to this object using its knockback modifier with the colliding object.
		// This assumes that 2 non-projectile objects collided and should be knocked away from each other.
		if (other.knockback_modifier == 0) {
			motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed/2, 1));
		}
	}
}