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
		audio_state += 1;
		if (audio_state > 4) {
			audio_state = 1;
		}
		
		switch (audio_state) {
		    case 1:
		        audio_master_gain(0.00);
		        break;
		    case 2:
		        audio_master_gain(0.20);
		        break;
		    case 3:
		        audio_master_gain(0.35);
		        break;
		    case 4:
		        audio_master_gain(0.50);
		        break;
		}
		audio_play_sound(UI__FTL____Audio_Test, 10, false, 0.5);
	}
}
