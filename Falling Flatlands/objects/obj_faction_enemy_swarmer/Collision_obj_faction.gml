// Nullify damage/knockback if colliding object is part of the same faction.
if (other.faction == faction) {
	exit;
}


// Play impact sound effects.
var impact_limit = 12;
impact_counter++;
if (impact_counter >= impact_limit) {
	impact_counter = 0;
	// Play impact audio.
	audio_play_sound(choose(
	SFX__FTL____Enemy_Swarmer_Impact__A_,
	SFX__FTL____Enemy_Swarmer_Impact__B_,
	SFX__FTL____Enemy_Swarmer_Impact__C_,
	SFX__FTL____Enemy_Swarmer_Impact__D_), 
	10, false);	
}

//// Only apply collision damage if colliding object is unique.
//if (object_is_ancestor(other.object_index, obj_ship_artemis)) {
//	// Check for collision damage cooldown to prevent excess damage from overlapping.
//	if (!collision_damage_cooldown && other.speed >= other.max_speed_default) {
//		// Apply damage and knockback.
//		// Call damage event.
//		take_damage = 1;
//		event_user(0);
		
//		// Call knockback event.
//		event_user(1);
//	}
//}

//// Nullify damage/knockback if colliding object is part of the same faction.
//if (other.faction == faction) {
//	exit;
//}

//// Only apply collision damage if colliding object is unique.
//if (object_is_ancestor(other.object_index, obj_ship_artemis)) {
//	// Check for collision damage cooldown to prevent excess damage from overlapping.
//	if (!collision_damage_cooldown && other.speed >= other.max_speed_default) {
//		// Toggle collision damage cooldown values
//		collision_damage_cooldown	= true;
//		collision_damage_timer		= collision_damage_timer_max;	
	
//		// Deduct 1 from health points.
//		health_points -= 1;
	
//		// Call "Take Damage Effects" event.
//		event_user(0);
//	}
//}