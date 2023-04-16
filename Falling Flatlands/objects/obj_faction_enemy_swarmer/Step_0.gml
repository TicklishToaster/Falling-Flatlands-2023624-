// Inherit the parent event
event_inherited();


// Set default ship rotation and acceleration variables.
var ship_rotation		= rotation_speed;
var ship_acceleration	= acceleration;


// Determine the angle required to face the target ship.
var new_angle = point_direction(x, y, obj_faction_player.x, obj_faction_player.y);
	
// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
new_angle = angle_difference(new_angle, image_angle);

// Rotate ship towards new angle.
image_angle += clamp(new_angle, -ship_rotation, ship_rotation);

// Force ship to move in the direction it's facing.
direction = image_angle;

// If player is outside of enagement range.
if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range) {
	// Apply acceleration to current motion.
	motion_add(image_angle, ship_acceleration);
}

// Move toward the player if too far.
if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range/20) {
	// Apply acceleration to current motion.
	motion_add(image_angle, ship_acceleration/2);
	//motion_add(image_angle, ship_acceleration/1);
}

// Halt motion if overlapping the player.
if (collision_point(x, y, obj_faction_player, true, true)) {
	motion_set(image_angle, 0);
}


#region
// Perform a complex movement calculation when there are fewer instances of this object.
if (instance_number(obj_faction_enemy_swarmer) < 32) {
	// Push away from other enemy objects if too close.
	for (var i = 0; i < instance_number(obj_faction_enemy); i += 1) {
		var target_inst = instance_find(obj_faction_enemy, i);
		if (target_inst == id) {
			continue;
		}
		if (point_in_circle(target_inst.x, target_inst.y, x, y, proximity_radius)) {
			var target_dir = point_direction(x, y, target_inst.x, target_inst.y);
			motion_add(target_dir-180, acceleration);
		}
	}
}

// Instead perform a simple movement calculation when there are many instances of this object.
else {
	// Push away from other enemy objects if too close.
	if (instance_number(obj_faction_enemy) > 1) {
		var target_inst = collision_circle(x, y, proximity_radius, obj_faction_enemy, false, true);
		if (target_inst != -4 && point_in_circle(target_inst.x, target_inst.y, x, y, proximity_radius)) {
			var target_dir = point_direction(x, y, target_inst.x, target_inst.y);
			motion_add(target_dir-180, acceleration);
		}
	}
}
#endregion
