// Inherit the parent event
event_inherited();


// Cancel damage and knockback if object is an enemy and shield is active.
if (other.faction != faction && shield_enabled && other != last_collider) {
	// Set hostile object as the most recent collider.
	last_collider = other;	
	
	// Set projectile health points to 0.
	other.projectile_hp = 0;
	
	// Play shield impact audio.
	audio_play_sound(choose(
	SFX__FTL____Shield_Hit_Impact__A_,
	SFX__FTL____Shield_Hit_Impact__B_,
	SFX__FTL____Shield_Hit_Impact__C_), 
	10, false);
	
	// Exit event.
	exit;
}

// If the colliding object is hostile to own faction.
if (other.faction != faction) {	
	// If hostile object is a projectile, i-frames are disabled, and projectile has not already collided with self.
	if (other.object_index == obj_projectile && !iframes_enabled && other != last_collider) {
		// Set hostile object as the most recent collider.
		last_collider = other;		
		
		// Deduct health points equal to projectile damage.
		health_points -= other.projectile_damage;
		
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
		
		// If current object should be affected by knockback.
		if (knockback_modifier != 0) {
			// Push this object away using its knockback modifier and the projectile knockback & direction. 
			motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, other.projectile_knockback * knockback_modifier);
		}
	}
	
	// If hostile object is not a projectile.
	if (other.object_index != obj_projectile) {
		// If i-frames are disabled.
		if (!iframes_enabled) {
			// Deduct a mimimum of 1 health point.
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
		}
		
		// If current object should be affected by knockback.
		if (knockback_modifier != 0) {		
			// This assumes that 2 non-projectile objects collided and should be knocked away from each other.
			motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed/2, 1));
		}
	}
}

//// Exit event.
//exit;


//// Cancel damage and knockback if object is an enemy and shield is active.
//if (other.faction == factions.enemy && shield_enabled) {
//	// Play shield impact audio.
//	audio_play_sound(choose(
//	SFX__FTL____Shield_Hit_Impact__A_,
//	SFX__FTL____Shield_Hit_Impact__B_,
//	SFX__FTL____Shield_Hit_Impact__C_), 
//	10, false);	
	
//	// Exit event.
//	exit;
//}

//// Apply knockback if colliding object is hostile and knockback applies to this object.
//if (other.faction == factions.enemy && knockback_modifier != 0) {
//	// If hostile object is a projectile, shield is not enabled, and projectile has not already hit this object.
//	if (other.object_index == obj_projectile && !shield_enabled && last_collider != other) {
//		// Push this object away using its knockback modifier and the projectile knockback & direction. 
//		motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, other.projectile_knockback * knockback_modifier);
//	}
//	// If hostile object is not a projectile.
//	else if (other.object_index != obj_projectile) {
//		// This assumes that 2 non-projectile objects collided and should be knocked away from each other.
//		motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed/2, 1));
//	}
//}

//// Take damage if object is hostile, i-frames are disabled, shield is disabled, and object has not already collided with self.
//if (other.faction == factions.enemy && !iframes_enabled && !shield_enabled && other != last_collider) {
//	// If hostile object is a projectile.
//	if (other.object_index == obj_projectile) {
//		// Set colliding object as the most recent collider.
//		last_collider = other;
//	}
	
//	// If hostile object is a projectile.
//	if (other.object_index == obj_projectile) {
//		// Deduct health points equal to projectile damage.
//		health_points -= other.projectile_damage;
//	}
//	// If hostile object is not a projectile.
//	else {
//		// Deduct a mimimum of 1 health point.
//		health_points -= 1;
//	}	

//	// Enable I-Frames.
//	iframes_enabled = true;
	
//	//// Change health.
//	//health_points -= 1;

//	// Play audio clip for taking damage.
//	if (health_points > 1) {
//		audio_play_sound(SFX__ITB____Ship_Damage, 10, false);
//	}

//	// Play special audio clip if health is critical.
//	if (health_points == 1) {
//		audio_play_sound(UI__ITB____Critical_Health, 10, false);
//	}
//}