// Exit if menu active is false.
if (!obj_menu.menu_active || room != rm_start) {
	exit;
}

for (var i = 0; i < instance_number(obj_menu_button_level_selection); ++i) {
	var target_id = instance_find(obj_menu_button_level_selection, i);
	if (target_id.selected == true) {
		level_id = target_id.level_id - 1;
	}
}

