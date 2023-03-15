// Exit if object is the originator.
if other == creator exit;

//// Destroy bullet when colliding with any object other than the originator or asteroids.
//if other.object_index != obj_asteroid {
//	instance_destroy();
//}

// Exit if object is part of same faction.
if other.faction == faction exit;

// Damage object if part of foreign faction.
with(other) {
	fact_exec = faction;
	event_perform(ev_other, ev_user0);
}

//// Destroy bullet when colliding with any object other than the originator or asteroids.
//if other.object_index != obj_asteroid {
//	instance_destroy();
//}