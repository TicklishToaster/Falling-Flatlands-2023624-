// Inherit the parent event
event_inherited();

// Nullify damage and knockback if colliding object is part of the same faction.
if (other.faction == faction) {
	exit;
}

// Exit if current object is a charger, as it reacts differently when taking damage.
if (object_is_ancestor(object_index, obj_faction_enemy_charger)) {
	exit;
}

// Check for collision damage cooldown to prevent excess damage from overlapping.
if (!collision_damage_cooldown) {
	//// Toggle collision damage cooldown values
	//collision_damage_cooldown	= true;
	//collision_damage_timer		= collision_damage_timer_max;	
	
	// Apply damage and knockback.
	// Call damage event.
	take_damage = 1;
	event_user(0);
		
	// Call knockback event.
	event_user(1);
}