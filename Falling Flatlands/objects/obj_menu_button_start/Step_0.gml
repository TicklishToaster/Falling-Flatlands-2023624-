// Exit if menu active is false.
if (!obj_menu.menu_active || room != rm_start) {
	exit;
}

if (point_in_rectangle(mouse_x, mouse_y, x, y, x + box_width, y + box_height) && temp_selected == false) {
	temp_selected = true;
	audio_play_sound(UI__ITB____Selection_Set, 10, false, 0.5);
}
else if (!point_in_rectangle(mouse_x, mouse_y, x, y, x + box_width, y + box_height) && temp_selected == true) {
	temp_selected = false;
}

if (level_selected == true && ship_selected == true && selected != true) {
	selected = true;
	audio_play_sound(UI__ITB____Level_Ready, 10, false, 0.5);
}
else if ((level_selected == false || ship_selected == false) && selected == true) {
	selected = false;
	audio_play_sound(UI__ITB____Level_Unready, 10, false, 0.5);
}


if (point_in_rectangle(mouse_x, mouse_y, x, y, x + box_width, y + box_height)) {
	if (input_mouse1_click && selected) {
		obj_menu_button_exit.level_active = true;
		audio_play_sound(UI__ITB____Selection_Confirm, 10, false, 0.5);
		with (obj_game) {
			event_user(0);
		}
	}
}

