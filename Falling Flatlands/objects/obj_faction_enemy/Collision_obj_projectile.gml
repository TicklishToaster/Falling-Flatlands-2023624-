/// @description Team Damage Enabled

// Inherit the parent event
event_inherited();

// Check for exit conditions.
for (var i = 0; i < array_length(projectile_collisions); i += 1) {
	// Nullify damage and knockback if projectile has already collided.
	if (other == projectile_collisions[i]) {
		// Exit event.
		exit;		
	}
	// Nullify damage and knockback if projectile was spawned by this object.
	if (other.creator == self) {
		// Exit event.
		exit;		
	}
}

// Exit if current object is a charger, as it reacts differently when taking damage.
if (object_is_ancestor(object_index, obj_faction_enemy_charger)) {
	exit;
}

// If the colliding projectile is hostile to current faction.
if (other.faction != faction) {
	// Append colliding projectile to projectile collisions array.
	array_push(projectile_collisions, other)
	
	// Set variables in the newly registered projectile.
	other.collider = self;
	other.projectile_hp -= 1;
	with (other) {event_user(0);}
		
	// Apply damage and knockback.
	take_damage = other.projectile_damage;
	// Call damage event.
	event_user(0);
		
	// Call knockback event.
	event_user(1);
}