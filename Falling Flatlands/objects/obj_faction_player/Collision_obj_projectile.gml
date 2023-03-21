// Inherit the parent event
event_inherited();


// Exit if projectile is part of the same faction or if projectile has already collided.
if (other.faction == faction || other == last_collider) {
	exit;
}

// Set variables in the newly registered projectile.
other.collider = self;
other.projectile_hp -= 1;
with (other) {event_user(0);}

// If the shield is enabled, append a boolean condition to the end of the collision entry array.
if (shield_enabled) {
	//array_push(collision_detection_data[array_length(collision_detection_data)-1], true);
	array_set(collision_detection_data[array_length(collision_detection_data)-1], 6, true);
}
