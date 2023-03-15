// Inherit the parent event
event_inherited();

// If the colliding object is hostile to own faction.
if (other.faction != faction) {	
	// If hostile object is a projectile and if projectile has not already collided with self.
	if (other.object_index == obj_projectile && other != last_collider) {
		// Set hostile object as the most recent collider.
		last_collider = other;		
		
		// Deduct health points equal to projectile damage.
		health_points -= other.projectile_damage;
		
		// Play audio clip for taking damage.
		if (health_points > 1) {
			audio_play_sound(choose(
			SFX__FTL____Energy_Shot_Impact__A_,
			SFX__FTL____Energy_Shot_Impact__B_,
			SFX__FTL____Energy_Shot_Impact__C_), 
			10, false);	
		}
		
		// Play special audio clip if health is critical.
		if (health_points == 1) {
			audio_play_sound(SFX__ITB__Shield_Down, 10, false);
		}		
		
		// If current object should be affected by knockback.
		if (knockback_modifier != 0) {
			// Push this object away using its knockback modifier and the projectile knockback & direction. 
			motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, other.projectile_knockback * knockback_modifier);
		}
	}
	
	// If hostile object is not a projectile.
	if (other.object_index != obj_projectile) {
		// Check for collision damage cooldown to prevent excess damage from overlapping,
		if (!collision_damage_cooldown) {
			// Toggle collision damage cooldown values
			collision_damage_cooldown	= true;
			collision_damage_timer		= collision_damage_timer_max;	
	
			// Deduct a mimimum of 1 health point.
			health_points -= 1;
			
			// Play audio clip for taking damage.
			if (health_points > 1) {
				audio_play_sound(choose(
				SFX__FTL____Energy_Shot_Impact__A_,
				SFX__FTL____Energy_Shot_Impact__B_,
				SFX__FTL____Energy_Shot_Impact__C_), 
				10, false);	
			}
			
			// Play special audio clip if health is critical.
			if (health_points == 1) {
				audio_play_sound(SFX__ITB__Shield_Down, 10, false);
			}			
		}
		
		// If current object should be affected by knockback.
		if (knockback_modifier != 0) {		
			// This assumes that 2 non-projectile objects collided and should be knocked away from each other.
			motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed/2, 1));
		}
	}
}