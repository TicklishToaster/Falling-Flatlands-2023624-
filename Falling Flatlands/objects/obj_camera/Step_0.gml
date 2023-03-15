//// Follow Target
//if instance_exists(target){
//	global.cameraX = target.x - (global.cameraWidth/2);
//	global.cameraY = target.y - (global.cameraHeight/2);
	
//	global.cameraX = clamp(global.cameraX, 0, room_width-global.cameraWidth);
//	global.cameraY = clamp(global.cameraY, 0, room_height-global.cameraHeight);
//}

//// Set Camera Pos
//camera_set_view_pos(view_camera[0], global.cameraX, global.cameraY);

//// Trigger Camera Shake
//global.cameraX += random_range(-global.cameraShake, global.cameraShake);
//global.cameraY += random_range(-global.cameraShake, global.cameraShake);

//if global.cameraShake > 0 {
//	global.cameraShake -= 0.2;
//	if global.cameraShake < 0 {global.cameraShake = 0;}
//}

//// Parallax Background Layer 0
//layer_x("Parallax_0", global.cameraX*0.90);
//layer_y("Parallax_0", global.cameraY*0.90);

//// Parallax Background Layer 1
//layer_x("Parallax_1", global.cameraX*0.80);
//layer_y("Parallax_1", global.cameraY*0.80);

//// Parallax Background Layer 2
//layer_x("Parallax_2", global.cameraX*0.70);
//layer_y("Parallax_2", global.cameraY*0.70);

//// Parallax Background Layer 3
//layer_x("Parallax_3", global.cameraX*0.60);
//layer_y("Parallax_3", global.cameraY*0.60);


// Follow Target //////////////////////////////////////////////////////////////
if (instance_exists(target) && (!state_panning)) {
	// Set Camera Position
	camera_x = target.x - (camera_width  / 2);
	camera_y = target.y - (camera_height / 2);
}

// Pann Over To New Target
if (instance_exists(target) && (state_panning)) {
	// Pann from Origin Object to Target Object using sin(pann_coefficient) to move from 0% - 100% distance.
	camera_x = lerp(pann_origin_object.hotspot_x - (camera_width  / 2), pann_target_object.hotspot_x - (camera_width  / 2), dsin(pann_coefficient * 90));
	camera_y = lerp(pann_origin_object.hotspot_y - (camera_height / 2), pann_target_object.hotspot_y - (camera_height / 2), dsin(pann_coefficient * 90));
}

// Camera Shake ///////////////////////////////////////////////////////////////
if camera_shake > 0 {
	show_debug_message(camera_shake)
	camera_x += random_range(-camera_shake, camera_shake);
	camera_y += random_range(-camera_shake, camera_shake);
	camera_shake = clamp(camera_shake - 0.2, 0, 10);
}

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