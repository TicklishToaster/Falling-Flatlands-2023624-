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
draw_sprite_ext(spr_menu_icon_controls, 0, x + box_width/2, y + box_height/2, 4, 4, 0, -1, 1);

if (selected) {
	// Level Select Container Box
	var offset_x	= uc_get_view_x() + (box*2 + 1)*4 + (box/2)*4;
	var offset_y	= uc_get_view_y() + (box*0 + 1)*4 + (box/2)*4;
	var box_w		= (box*6 - 1)*4;
	var box_h		= (box*6 - 1)*4;
	draw_sprite_stretched(spr_menu_box_x4, 1, offset_x, offset_y, box_w, box_h);
	draw_sprite_stretched(spr_menu_box_x4, 1, offset_x + (box*8)*4, offset_y, box_w - (box*1)*4, box_h);
	
	// Ship Controls
	var offset_x	= (box*11+ 1)*4 + (box/2)*4;
	var offset_y	= (box*7 + 1)*4 + (box/2)*4;	
	var offset_x	= uc_get_view_x() + (box*2)*4 + (box/2)*4;
	var offset_x	= uc_get_view_x() + (box*2)*4 + 4;
	var offset_y	= uc_get_view_y() + (box*0)*4 + (box/2)*4;	
	var box_w		= (box*2 - 1)*4;
	var box_h		= (box*2 - 1)*4;
	
	draw_sprite_ext(spr_keyboard_base, 39-1,	offset_x + (box/2 + 2)*4, offset_y + (box*0 + 2)*4 - (box*0.5 + 0)*4 + (box/2)*4, 4, 4, 0, -1, 1);
	draw_sprite_ext(spr_keyboard_base, 17-1,	offset_x + (box/2 + 2)*4, offset_y + (box*1 + 2)*4 - (box*0.5 + 1)*4 + (box/2)*4, 4, 4, 0, -1, 1);
	draw_sprite_ext(spr_keyboard_base, 35-1,	offset_x + (box/2 + 2)*4, offset_y + (box*2 + 2)*4 - (box*0.5 + 2)*4 + (box/2)*4, 4, 4, 0, -1, 1);
	draw_sprite_ext(spr_keyboard_base, 20-1,	offset_x + (box/2 + 2)*4, offset_y + (box*3 + 2)*4 - (box*0.5 + 3)*4 + (box/2)*4, 4, 4, 0, -1, 1);
	draw_sprite_ext(spr_keyboard_special, 05-1, offset_x + (box/2 + 2)*4, offset_y + (box*4 + 2)*4 - (box*0.5 + 4)*4 + (box/2)*4, 4, 4, 0, -1, 1);
	draw_sprite_ext(spr_keyboard_special, 11-1, offset_x + (box/2 + 2)*4, offset_y + (box*5 + 2)*4 - (box*0.5 + 5)*4 + (box/2)*4, 4, 4, 0, -1, 1);
	
	draw_sprite_ext(spr_keyboard_base, 05-1,	offset_x + (box*8)*4 + (box/2 + 2)*4, offset_y + (box*0 + 2)*4 - (box*0.5 + 0)*4 + (box/2)*4, 4, 4, 0, -1, 1);
	draw_sprite_ext(spr_keyboard_base, 06-1,	offset_x + (box*8)*4 + (box/2 + 2)*4, offset_y + (box*1 + 2)*4 - (box*0.5 + 1)*4 + (box/2)*4, 4, 4, 0, -1, 1);
	draw_sprite_ext(spr_keyboard_base, 07-1,	offset_x + (box*8)*4 + (box/2 + 2)*4, offset_y + (box*2 + 2)*4 - (box*0.5 + 2)*4 + (box/2)*4, 4, 4, 0, -1, 1);	
	
	
	draw_set_font(fnt_poco_button);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var text_w = (box*5 - 8)*4 -1;
	var text_h = 28;
	
	draw_text_ext(offset_x + (box/2 + 4)*4 + (box*2)*4, offset_y + (box*0 + 2)*4 - (box*0.5 + 0)*4 + (box/2)*4, "Accelerate", text_h, text_w);
	draw_text_ext(offset_x + (box/2 + 4)*4 + (box*2)*4, offset_y + (box*1 + 2)*4 - (box*0.5 + 1)*4 + (box/2)*4, "Decelerate", text_h, text_w);
	draw_text_ext(offset_x + (box/2 + 4)*4 + (box*2)*4, offset_y + (box*2 + 2)*4 - (box*0.5 + 2)*4 + (box/2)*4, "Rotate Left", text_h, text_w);
	draw_text_ext(offset_x + (box/2 + 4)*4 + (box*2)*4, offset_y + (box*3 + 2)*4 - (box*0.5 + 3)*4 + (box/2)*4, "Rotate Right", text_h, text_w);
	draw_text_ext(offset_x + (box/2 + 4)*4 + (box*2)*4, offset_y + (box*4 + 2)*4 - (box*0.5 + 4)*4 + (box/2)*4, "Toggle Shield", text_h, text_w);
	draw_text_ext(offset_x + (box/2 + 4)*4 + (box*2)*4, offset_y + (box*5 + 2)*4 - (box*0.5 + 5)*4 + (box/2)*4, "Shoot", text_h, text_w);
	
	draw_text_ext(offset_x + (box/2 + 4)*4 + (box*10)*4, offset_y + (box*0 + 2)*4 - (box*0.5 + 0)*4 + (box/2)*4, "Rocket 1", text_h, text_w);
	draw_text_ext(offset_x + (box/2 + 4)*4 + (box*10)*4, offset_y + (box*1 + 2)*4 - (box*0.5 + 1)*4 + (box/2)*4, "Rocket 2", text_h, text_w);
	draw_text_ext(offset_x + (box/2 + 4)*4 + (box*10)*4, offset_y + (box*2 + 2)*4 - (box*0.5 + 2)*4 + (box/2)*4, "Rocket 3", text_h, text_w);
}