// Exit if foreign object is part of the same faction.
if (other.faction == faction) {
	exit;
}

//// Exit if foreign object has already collided with self.
//if (last_collider == other) {
//	//show_debug_message("EXIT")
//	exit;
//}

// Check if current object has a sprite.
if (sprite_index != noone) {
	// Determine the direction towards the source of the collision.
	var impact_direction = point_direction(x, y, other.x, other.y);
	
	// Calculate the distance between the player ship center, and the player ship edge closest to the source of damage.
	for (var i = 0; i < 64; i += 1) {
		// Procedurally draw a line from origin to edge. If the line stops overlapping the ship sprite, the ship edge has been found.
		if (!position_meeting(x + lengthdir_x(i, impact_direction), y + lengthdir_y(i, impact_direction), self) == true) {			
			// Create new collision entry and fill it blank.
			var collision_entry = array_create(6, noone);
			
			// Set x/y coordinate.
			collision_entry[0] = x + lengthdir_x(i, impact_direction);
			collision_entry[1] = y + lengthdir_y(i, impact_direction);
			
			// Set the resulting angle difference from current object angle to collision angle.
			collision_entry[2] = impact_direction;
			
			// Set the angle the current object is facing at the time of collision.
			collision_entry[3] = image_angle;
			
			// Set the length from the current object sprite center to the edge.
			collision_entry[4] = i;
			
			// Set a timer value to be used for various functions.
			collision_entry[5] = 5;
			
			// Append the new collision data to the array.
			array_push(collision_detection_data, collision_entry);

			// Break out of loop as the sprite edge where the object impact occured has been found.
			break;
		}
	}
}