// Exit if menu active is false.
if (!obj_menu.menu_active) {
	exit;
}

var sub_img = 1;
var text_trans = 1;

// Level Start Box
draw_sprite_stretched(spr_menu_box_x4, sub_img, x, y, box_width, box_height);

// Draw level win condition text.
if (level_id != -1) {
	// Level Start Text
	draw_set_font(fnt_poco);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var text_offset_x = x + box_width/2 + 1;
	var text_offset_x = x + 8 + 4;
	var text_offset_y = y - 2 + 3;
	var text_w = box_width - 18;
	var text_h = box_height/3;
	var string_info = obj_game.level_data_condition_descriptions[level_id][2];
	draw_text_ext_transformed_colour(text_offset_x, text_offset_y, string_info, text_h, text_w, 
		1, 1, 0, c_white, c_white, c_white, c_white, text_trans);
}