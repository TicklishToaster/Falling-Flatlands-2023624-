// Follow Target //////////////////////////////////////////////////////////////
if (instance_exists(target) && (!state_panning)) {
	// Set Camera Position
	camera_x = target.x - (camera_width  / 2);
	camera_y = target.y - (camera_height / 2);
	x = camera_x;
	y = camera_y;
	//camera_x = clamp(camera_x, 0, room_width  - camera_width);
	//camera_y = clamp(camera_y, 0, room_height - camera_height);
}

// Pann Over To New Target
if (instance_exists(target) && (state_panning)) {
	// Pann from Origin Object to Target Object using sin(pann_coefficient) to move from 0% - 100% distance.
	camera_x = lerp(pann_origin_object.hotspot_x - (camera_width  / 2), pann_target_object.hotspot_x - (camera_width  / 2), dsin(pann_coefficient * 90));
	camera_y = lerp(pann_origin_object.hotspot_y - (camera_height / 2), pann_target_object.hotspot_y - (camera_height / 2), dsin(pann_coefficient * 90));
}

//// Camera Shake ///////////////////////////////////////////////////////////////
//if camera_shake > 0 {
//	camera_x += random_range(-camera_shake, camera_shake);
//	camera_y += random_range(-camera_shake, camera_shake);
//	camera_shake = clamp(camera_shake - 0.2, 0, 10);
//}

// Set Camera Pos /////////////////////////////////////////////////////////////
camera_set_view_pos(view_camera[0], camera_x, camera_y);

// Parallax Backgrounds ///////////////////////////////////////////////////////
// Parallax Background Layer 1
layer_x("Parallax_1", background_shift_x * 0.70);
layer_y("Parallax_1", background_shift_y * 0.70);
// Parallax Background Layer 2
layer_x("Parallax_2", background_shift_x * 0.80);
layer_y("Parallax_2", background_shift_y * 0.80);
// Parallax Background Layer 3
layer_x("Parallax_3", background_shift_x * 0.90);
layer_y("Parallax_3", background_shift_y * 0.90);
// Parallax Background Layer 4
layer_x("Parallax_4", background_shift_x * 0.60);
layer_y("Parallax_4", background_shift_y * 0.60);