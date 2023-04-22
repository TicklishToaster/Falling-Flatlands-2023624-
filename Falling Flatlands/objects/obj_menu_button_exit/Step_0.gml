// Exit if menu active is false.
if (!obj_menu.menu_active || room == rm_start) {
	exit;
}

if (point_in_rectangle(mouse_x, mouse_y, x, y, x + box_width, y + box_height) && temp_selected == false) {
	temp_selected = true;
	audio_play_sound(UI__ITB____Selection_Set, 10, false, 0.5);
}
else if (!point_in_rectangle(mouse_x, mouse_y, x, y, x + box_width, y + box_height) && temp_selected == true) {
	temp_selected = false;
}

if (point_in_rectangle(mouse_x, mouse_y, x, y, x + box_width, y + box_height)) {
	if (input_mouse1_click && temp_selected) {
		obj_menu.instance_layer_activation = true;
		instance_activate_object(obj_faction);
		instance_activate_object(obj_projectile);
		instance_activate_object(obj_swarmer_drone);
		instance_destroy(obj_menu.dopple_id)
		Camera.x = obj_menu.camera_last_x;
		Camera.y = obj_menu.camera_last_y;		
		
		
		// Play level exit audio clips.
		audio_play_sound(UI__ITB____Selection_Confirm, 10, false, 0.5);
		audio_play_sound(UI__FTL____Level_Exit, 10, false, 0.5);
		obj_menu.menu_active = true;
		temp_selected = false;
		room_goto(rm_start);
		
		////obj_menu_button_exit.level_active = true;
		//audio_play_sound(UI__ITB____Selection_Confirm, 10, false, 0.5);
		//with (obj_game) {
		//	event_user(0);
		//}
	}
}

