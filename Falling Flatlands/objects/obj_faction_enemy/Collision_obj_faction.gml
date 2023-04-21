// Inherit the parent event
event_inherited();

// If current object is not onscreen then exit this event and nullify the potentially expensive processes below.
if (!point_in_rectangle(x, y, Camera.border_x1, Camera.border_y1, Camera.border_x2, Camera.border_y2)) {
	exit;
}


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
	// Apply damage and knockback.
	// Call damage event.
	take_damage = 1;
	event_user(0);
		
	// Call knockback event.
	event_user(1);
}