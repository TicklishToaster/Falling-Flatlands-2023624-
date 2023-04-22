// Exit if menu active is false.
if (!obj_menu.menu_active) {
	exit;
}


var sub_img = 1;
var text_trans = 0.6;
if (selected && room == rm_start) {
	sub_img = 3;
	text_trans = 1;
}

// Level Start Box
draw_sprite_stretched(spr_menu_box_x4, sub_img, x, y, box_width, box_height);

// Level Start Text
draw_set_font(fnt_poco_button);
draw_set_halign(fa_middle);
draw_set_valign(fa_top);
var text_offset_x = x + box_width/2 + 1;
var text_offset_y = y - 2;
var text_w = box_width;
var text_h = box_height
var string_info = "START";
draw_text_ext_transformed_colour(text_offset_x, text_offset_y, string_info, text_h, text_w, 
	1, 1, 0, c_green, c_green, c_green, c_green, text_trans);