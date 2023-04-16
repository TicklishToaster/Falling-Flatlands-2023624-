// Inherit the parent event
event_inherited();


// Exit if projectile is part of the same faction or if projectile has already collided.
if (other.faction == faction || other == last_collider) {
	exit;
}

// Exit if current object is the Artemis, as it reacts differently to collisions.
if (ship_artemis) {
	exit;
}


// If the colliding projectile is hostile to current faction.
if (other.faction != faction) {
	// Set projectile as the most recent collider.
	last_collider = other;
	
	// Set variables in the newly registered projectile.
	other.collider = self;
	other.projectile_hp -= 1;
	with (other) {event_user(0);}
		
	// Nullify damage if shield is active.
	if (shield_enabled) {		
		// Append a boolean condition for later use.
		array_set(collision_detection_data[array_length(collision_detection_data)-1], 7, true);
		
		// Apply effects if shield effect cooldown is currently disabled.
		if (!shield_effect_cooldown) {
			// Set shield effect cooldown to true to prevent it triggering on every frame.
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
		
	// Nullify damage and knockback if i-frames are enabled.
	if (iframes_enabled) {
		// Play projectile miss audio.
		audio_play_sound(SFX__FTL____Projectile_Miss, 10, false);
		
		// Exit event.
		exit;		
	}
		
	// Apply damage and knockback.
	take_damage = other.projectile_damage;
	// Call damage event.
	event_user(0);
		
	// Call knockback event.
	event_user(1);
}




//// If the colliding projectile is hostile to own faction.
//if (other.faction != faction) {	
//	// If the shield is enabled, append a boolean condition to the end of the collision entry array.
//	if (shield_enabled) {
//		array_set(collision_detection_data[array_length(collision_detection_data)-1], 6, true);
//	}
	
//	// Set projectile as the most recent collider.
//	last_collider = other;
	
//	// Set variables in the newly registered projectile.
//	other.collider = self;
//	other.projectile_hp -= 1;
//	with (other) {event_user(0);}
	

//	// Nullify damage/knockback if shield is active.
//	if (shield_enabled) {
//		// Set projectile health points to 0 to prevent piercing through shield.
//		other.projectile_hp = 0;
	
//		// Play shield impact audio.
//		audio_play_sound(choose(
//		SFX__FTL____Shield_Hit_Impact__A_,
//		SFX__FTL____Shield_Hit_Impact__B_,
//		SFX__FTL____Shield_Hit_Impact__C_), 
//		10, false);
	
//		// Exit event.
//		exit;
//	}
	
//	// Nullify damage/knockback if i-frames are enabled.
//	if (iframes_enabled) {
//		// Play projectile miss audio.
//		audio_play_sound(SFX__FTL____Projectile_Miss, 10, false);
	
//		// Exit event.
//		exit;
//	}	

//	// Apply damage/knockback if i-frames are disabled and projectile has not already collided.
//	if (!iframes_enabled) {		
//		// Deduct projectile damage from health points.
//		health_points -= other.projectile_damage;
		
//		// Enable I-Frames.
//		iframes_enabled = true;

//		// Play audio clip for taking damage.
//		if (health_points > 1) {audio_play_sound(SFX__ITB____Ship_Damage, 10, false);}

//		// Play special audio clip if health is critical.
//		if (health_points == 1) {audio_play_sound(UI__ITB____Critical_Health, 10, false);}
		
//		// Apply knockback to this object using its knockback modifier with the projectile knockback and direction. 
//		if (knockback_modifier != 0) {
//			motion_add(collision_detection_data[array_length(collision_detection_data)-1][2]-180, other.projectile_knockback * knockback_modifier);
//		}
		
//		// Trigger hit and flash camera functions.
//		uc_hit(collision_detection_data[array_length(collision_detection_data)-1][2]-180, 1, 0.1);
//		uc_flash(c_red, [0.4, 0.1], 0.2);
//	}
//}