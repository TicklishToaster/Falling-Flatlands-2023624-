/// @description Camera Setup
view_enabled = true;
view_visible[0] = true;


// Camera Vars ////////////////////////////////////////////////////////////////
//target = factions.player;
//camera_x = room_width/2;
//camera_y = room_height/2;
target = noone;
camera_x = 0;
camera_y = 0;

//camera_width = 1920;
//camera_height = 1080;
camera_width = 640;
camera_height = 640;
camera_shake = 0;

camera_set_view_size(view_camera[0], camera_width, camera_height);
view_set_wport(0, camera_width);
view_set_hport(0, camera_height);


// Display Vars ///////////////////////////////////////////////////////////////
display_scale = 2;
display_width = camera_width * display_scale;
display_height = camera_height * display_scale;

window_set_size(display_width, display_height);
surface_resize(application_surface, display_width, display_height);
window_set_fullscreen(false);


// GUI Vars ///////////////////////////////////////////////////////////////////
display_set_gui_size(camera_width, camera_height);
window_center();


// Parallax Background Vars ///////////////////////////////////////////////////
background_shift_x = 0;
background_shift_y = 0;

// Camera Panning Method //////////////////////////////////////////////////////
state_panning		= false;
pann_speed			= 0.01;
pann_coefficient	= 0.00;
pann_origin_object	= noone;
pann_target_object	= noone;
pann_origin_x		= 10;
pann_origin_y		= 10;

pann_camera = function(origin_object, target_object, move_speed) {
	show_debug_message("PANN START");
	state_panning		= true;
	pann_speed			= move_speed;
	pann_coefficient	= 0.00;
	pann_origin_object	= origin_object;
	pann_target_object	= target_object;
	pann_origin_x		= pann_origin_object.hotspot_x;
	pann_origin_y		= pann_origin_object.hotspot_y;
	pann_target_x		= pann_target_object.hotspot_x;
	pann_target_y		= pann_target_object.hotspot_y;
}