
// Update collision detection data.
for (var i = 0; i < array_length(collision_detection_data); i += 1) {
	// Only update data if the timer value is above 0. 
	// This assumes that each collision only needs to be registered for 5 seconds total.
	if (collision_detection_data[i][5] > 0) {
		// Countdown the timer value.
		collision_detection_data[i][5] = clamp(collision_detection_data[i][5] - (room_speed / 60 / 60), 0, 5);
		// Update the x/y position of the collision, accounting for parent object positioning and angle.
		collision_detection_data[i][0] = x + lengthdir_x(collision_detection_data[i][4], collision_detection_data[i][2] + image_angle - collision_detection_data[i][3]);
		collision_detection_data[i][1] = y + lengthdir_y(collision_detection_data[i][4], collision_detection_data[i][2] + image_angle - collision_detection_data[i][3]);
	}
}



//speed = speed * global.time_modifier;

