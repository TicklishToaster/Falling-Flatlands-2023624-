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
	if (input_mouse1_click && selected == false) {
		for (var i = 0; i < instance_number(obj_menu_button_level_selection); ++i) {
			var target_id = instance_find(obj_menu_button_level_selection, i);
			target_id.selected = false;
		}
		selected = true;
		obj_menu_button_start.level_selected = true;
		obj_game.selected_level_id = level_id - 1;
		audio_play_sound(UI__ITB____Selection_Confirm, 10, false, 0.5);
		exit;
	}
	if (input_mouse1_click && selected == true) {
		for (var i = 0; i < instance_number(obj_menu_button_level_selection); ++i) {
			var target_id = instance_find(obj_menu_button_level_selection, i);
			target_id.selected = false;
		}
		obj_menu_button_start.level_selected = false;
		obj_game.selected_level_id = -1;
		audio_play_sound(UI__ITB____Selection_Cancel, 10, false, 0.5);
		exit;
	}
}
