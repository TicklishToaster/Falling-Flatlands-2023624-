// Exit if menu active is false.
if (!obj_menu.menu_active) {
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
	if (input_mouse1_click) {
		game_end();
	}
}
