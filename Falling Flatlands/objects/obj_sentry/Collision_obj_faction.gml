// Inherit the parent event
event_inherited();

// Nullify damage/knockback if colliding object is part of the same faction.
if (other.faction == faction) {
	exit;
}

// Check for collision damage cooldown to prevent excess damage from overlapping.
if (!collision_damage_cooldown) {
	// Toggle collision damage cooldown values
	collision_damage_cooldown	= true;
	collision_damage_timer		= collision_damage_timer_max;	
	
	// Deduct 1 from health points.
	health_points -= 1;
	
	// Call "Take Damage Effects" event.
	event_user(0);
}

// Apply knockback to this object using its knockback modifier with the colliding object.
// This assumes that 2 non-projectile objects collided and should be knocked away from each other.
if (knockback_modifier != 0) {		
	motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed/2, 1));
}