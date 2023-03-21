// Inherit the parent event
event_inherited();


// Exit if foreign object is part of the same faction.
if (other.faction == faction) {
	exit;
}

// If the shield is enabled, append a boolean condition to the end of the collision entry array.
if (shield_enabled) {
	array_push(collision_detection_data[array_length(collision_detection_data)-1], true);
}
