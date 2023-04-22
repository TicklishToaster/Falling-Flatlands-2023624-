// Exit if menu active is false.
if (!obj_menu.menu_active) {
	exit;
}


var box = 15;
var sub_img = 1;
var text_trans = 0.6;
if (selected || temp_selected) {
	sub_img = 3;
	text_trans = 1;
}
	
// Level Start Box
draw_sprite_stretched(spr_menu_box_x4, sub_img, x, y, box_width, box_height);
draw_sprite_ext(spr_menu_icon_audio, audio_state-1, x + box_width/2, y + box_height/2, 4, 4, 0, -1, 1);