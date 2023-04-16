// Inherit the parent event
event_inherited();

// Nullify damage/knockback if colliding object is part of the same faction or if self is boosting.
if (other.faction == faction || boosting) {
	exit;
}

// Check for collision damage cooldown to prevent excess damage from overlapping.
if (!collision_damage_cooldown) {
	// Call damage event.
	take_damage = 1;
	event_user(0);
		
	// Apply knockback only if object is not boosting.
	if (!boosting) {
		// Call knockback event.
		event_user(1);
	}
}