// Exit if menu active is false.
if (!obj_menu.menu_active) {
	exit;
}


if (selected) {
	draw_sprite_stretched(spr_menu_box_ship_select, 1, 
	x, y, 
	box_width, box_height);
		
	draw_sprite_ext(spr_menu_ship_selection, icon_sub_img, 
	x+4, y-4,
	1, 1, 0, -1, 1);
}

if (temp_selected) {		
	draw_sprite_ext(spr_menu_ship_selection, icon_sub_img, 
	x+4, y-4,
	1, 1, 0, -1, 1);
}