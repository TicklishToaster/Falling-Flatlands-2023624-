//// Set defaulttarget if none exists.
//if (!instance_exists(target)) {
//	target = obj_faction_player;
//}


//// Update Hotspot (Center of Camera)
//hotspot_x = x + camera_width /2;
//hotspot_y = y + camera_height/2;




//if (keyboard_check_pressed(ord("1"))) {
//	scale_width	 = 320;
//	scale_height = 180;	
//	display_scale = 1920/scale_width;

//	camera_width  = scale_width  * display_scale * 0.5;
//	camera_height = scale_height * display_scale * 0.5;
//	//camera_width  = scale_width  * display_scale * 1.0;
//	//camera_height = scale_height * display_scale * 1.0;
//	show_debug_message(camera_width)
//	show_debug_message(camera_height)

//	camera_set_view_size(view_camera[0], camera_width, camera_height);
//	view_set_wport(0, camera_width);
//	view_set_hport(0, camera_height);


//	display_width  = scale_width  * display_scale * 1.0;
//	display_height = scale_height * display_scale * 1.0;
//	show_debug_message(display_width)
//	show_debug_message(display_height)	

//	var my_scale = display_width/camera_width;

//	window_set_size(display_width, display_height);
//	//application_surface_draw_enable(false);
//	//surface_resize(application_surface, camera_width*2, camera_height*2);
//	surface_resize(application_surface, display_width, display_height);
	
//	//surface_resize(application_surface, display_width*my_scale, display_height*my_scale);
//	//surface_resize(application_surface, display_get_width(), display_get_height());
//	window_set_fullscreen(false);
//	//window_set_fullscreen(true);
//	window_center();
//}

//if (keyboard_check_pressed(ord("2"))) {
//	scale_width	 = 320;
//	scale_height = 180;	
//	//display_scale = display_get_width()/scale_width;
//	display_scale = 2560/scale_width;

//	camera_width  = scale_width  * display_scale * 0.5;
//	camera_height = scale_height * display_scale * 0.5;
//	//camera_width  = scale_width  * display_scale * 1.0;
//	//camera_height = scale_height * display_scale * 1.0;

//	camera_set_view_size(view_camera[0], camera_width, camera_height);
//	view_set_wport(0, camera_width);
//	view_set_hport(0, camera_height);


//	display_width  = scale_width  * display_scale * 1.0;
//	display_height = scale_height * display_scale * 1.0;
//	show_debug_message(display_width)
//	show_debug_message(display_height)		

//	var my_scale = display_width/camera_width;

//	window_set_size(display_width, display_height);
//	//application_surface_draw_enable(false);
//	//surface_resize(application_surface, camera_width*2, camera_height*2);
//	surface_resize(application_surface, display_width, display_height);
	
//	//surface_resize(application_surface, display_width*my_scale, display_height*my_scale);
//	//surface_resize(application_surface, display_get_width(), display_get_height());
//	window_set_fullscreen(false);
//	//window_set_fullscreen(true);
//	window_center();
//}