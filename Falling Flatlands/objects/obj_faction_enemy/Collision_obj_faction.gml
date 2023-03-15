// Inherit the parent event
event_inherited();

// Exit if foreign object is part of the same faction.
if (other.faction == faction) {
	exit;
}

// Exit if foreign object is a projectile and has already collided with self.
if (other.object_index == obj_projectile && last_collider == other) {
	exit;
}

// Apply conditional effects to foreign projectile objects.
if (other.object_index == obj_projectile) {
	other.collider = self;
	other.projectile_hp -= 1;
	with (other) {event_user(0);}
}

//// Toggle collision damage cooldown to prevent excess damage from overlapping an enemy.
//if (other.object_index != obj_projectile && !collision_damage_cooldown) {
//	collision_damage_cooldown	= true;
//	collision_damage_timer		= collision_damage_timer_max;
//}

