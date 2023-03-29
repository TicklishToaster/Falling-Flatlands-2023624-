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

scale_width	 = 640;
scale_height = 360;

//camera_width = 1920;
//camera_height = 1080;
//camera_width = 1280;
//camera_height = 720;
//camera_width = 640;
//camera_height = 360;
camera_shake = 0;

//camera_set_view_size(view_camera[0], camera_width, camera_height);
//view_set_wport(0, camera_width);
//view_set_hport(0, camera_height);


// Display Vars ///////////////////////////////////////////////////////////////
display_scale = display_get_width()/scale_width;
//display_scale = 1920/camera_width;

//display_scale_w = display_get_width()/(camera_width/2);
//display_scale_h = display_get_height()/(camera_height/2);
//display_scale = 2;


camera_width  = scale_width  * 2;
camera_height = scale_height * 2;

camera_set_view_size(view_camera[0], camera_width, camera_height);
view_set_wport(0, camera_width);
view_set_hport(0, camera_height);


display_width  = scale_width  * display_scale;
display_height = scale_height * display_scale;

window_set_size(display_width, display_height);
surface_resize(application_surface, display_width, display_height);
//application_surface_draw_enable(false);
//window_set_fullscreen(true);

//target = noone;
//camera_x = 0;
//camera_y = 0;
//scale_width	 = 640;
//scale_height = 360;
////camera_width = scale_width
////camera_height = scale_height
//camera_shake = 0;

//application_surface_draw_enable(false);
//window_set_fullscreen(true);

//monitor_W = display_get_width();
//monitor_H = display_get_height();
////monitor_W = 1280;
////monitor_H = 720;
//camera_width  = monitor_W;
//camera_height = monitor_H;
//monitor_offset_X = (monitor_W - scale_width)  / 2;
//monitor_offset_Y = (monitor_H - scale_height) / 2;
//surface_resize(application_surface, 1600, 900);



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