// Inherit the parent event
event_inherited();


// If the colliding projectile is hostile to own faction.
if (other.faction != faction) {	
	//// Apply increased damage to the colliding object based on the speed of the Artemis.
	//if (speed > 7) {
	//	other.health_points -= 5;
	//}
	//else if (speed > 6) {
	//	other.health_points -= 3;
	//}
	//else if (speed > 5) {
	//	other.health_points -= 2;
	//}
	//else if (speed >= 4) {
	//	other.health_points -= 1;
	//}
	
	other.health_points += 2;
	
	// Apply knockback if colliding object is stationary.
	if (other.knockback_modifier == 0) {
		motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed, 1));
	}
	// 
	//else if (other.knockback_modifier != 0) {
	//	with (other) {
	//		motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180*0, max(speed, 1));
	//	}
	//}
	
	//// Apply knockback if colliding object is stationary.
	//if (!iframes_enabled && !shield_enabled) {
	//	// Apply knockback to this object using its knockback modifier with the colliding object.
	//	// This assumes that 2 non-projectile objects collided and should be knocked away from each other.
	//	if (other.knockback_modifier == 0) {
	//		motion_set(collision_detection_data[array_length(collision_detection_data)-1][2]-180, max(speed/2, 1));
	//	}
	//}
}