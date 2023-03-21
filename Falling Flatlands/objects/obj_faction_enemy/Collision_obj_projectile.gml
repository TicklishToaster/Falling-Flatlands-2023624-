// Inherit the parent event
event_inherited();


// Nullify damage/knockback if projectile has already collided or if projectile was spawned by this object.
for (var i = 0; i < array_length(projectile_collisions); i += 1) {
	if (other == projectile_collisions[i] || other.creator == self) {
		// Exit event.
		exit;		
	}
}

// Check to see if projectile was spawned by this object.
if (other.creator != self) {
	// Append colliding projectile to projectil collisions array.
	array_push(projectile_collisions, other)

	// Set variables in the newly registered projectile.
	other.collider = self;
	other.projectile_hp -= 1;
	with (other) {event_user(0);}	
		
	// Deduct projectile damage from health points.
	health_points -= other.projectile_damage;

	// Call "Take Damage Effects" event.
	event_user(0);
}
			
// Apply knockback to this object using its knockback modifier with the projectile knockback and direction. 
if (knockback_modifier != 0) {
	//motion_add(collision_detection_data[array_length(collision_detection_data)-1][2]-180+180, other.projectile_knockback * knockback_modifier);
	motion_add(collision_detection_data[array_length(collision_detection_data)-1][2]-180, other.projectile_knockback * knockback_modifier);
	//motion_add(dir, other.projectile_knockback * knockback_modifier);	
	var dir = point_direction(other.x, other.y, x, y);
	//motion_add(dir-180, other.projectile_knockback);
	//show_debug_message(point_direction(x, y, other.x, other.y))
	//show_debug_message(point_direction(other.x, other.y, x, y))
}