// Inherit the parent event
event_inherited();


// If the colliding projectile is hostile to own faction.
if (other.faction != faction) {	
	// Nullify damage/knockback if projectile has already collided.
	if (other == last_collider) {
		// Exit event.
		exit;
	}
	
	// Nullify damage/knockback if speed is greater than 4.
	if (speed > 4) {
		// Set projectile as the most recent collider.
		last_collider = other;	
	
		// Set projectile health points to 0 to prevent piercing through shield.
		other.projectile_hp = 0;
	
		// Play shield impact audio.
		audio_play_sound(choose(
		SFX__FTL____Shield_Hit_Ion__A_,
		SFX__FTL____Shield_Hit_Ion__B_,
		SFX__FTL____Shield_Hit_Ion__C_), 
		10, false);
	
		// Exit event.
		exit;
	}
	
	// Nullify damage/knockback if i-frames are enabled.
	if (iframes_enabled) {
		// Set projectile as the most recent collider.
		last_collider = other;
	
		// Play projectile miss audio.
		audio_play_sound(SFX__FTL____Projectile_Miss, 10, false);
	
		// Exit event.
		exit;
	}	

	// Apply damage/knockback if i-frames are disabled and projectile has not already collided.
	if (!iframes_enabled && other != last_collider) {
		// Set projectile as the most recent collider.
		last_collider = other;		
		
		// Deduct projectile damage from health points.
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
		
		// Apply knockback to this object using its knockback modifier with the projectile knockback and direction. 
		if (knockback_modifier != 0) {
			motion_add(collision_detection_data[array_length(collision_detection_data)-1][2]-180, other.projectile_knockback * knockback_modifier);
		}
	}
}