// Exit if menu active is false.
if (!menu_active) {
	exit;
}

// Full Menu Background
draw_sprite_stretched(spr_menu_box_x4, 0, uc_get_view_x(), uc_get_view_y(), aspect_x, aspect_y);

//var n = 15;
//for (var xx = 0; xx < (aspect_x/4)/n; ++xx) {
//	//draw_line(0, xx * n, aspect_x, xx * n)
//	//draw_line_width(uc_get_view_x() + xx * n * 4, uc_get_view_y(), uc_get_view_x() + xx * n * 4, uc_get_view_y() + (aspect_y/1), 1);
//	draw_rectangle(uc_get_view_x() + xx * n * 4, uc_get_view_y(), uc_get_view_x() + xx * n * 4 + 3, uc_get_view_y() + (aspect_y/1), false);
//}
//for (var yy = 0; yy < (aspect_y/4)/n; ++yy) {
//	//draw_line(yy * n, 0, yy * n, aspect_y)
//	//draw_line_width(uc_get_view_x(), uc_get_view_y() + yy * n * 4, uc_get_view_x() + (aspect_x/1), uc_get_view_y() + yy * n * 4, 1);
//	draw_rectangle(uc_get_view_x(), uc_get_view_y() + yy * n * 4, uc_get_view_x() + (aspect_x/1), uc_get_view_y() + yy * n * 4 + 3, false);
//}

var box = 15;

// Level Select Container Box
var offset_x	= uc_get_view_x() + (box*2 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*0 + 1)*4 + (box/2)*4;
var box_w		= (box*6 - 1)*4;
var box_h		= (box*6 - 1)*4;
draw_sprite_stretched(spr_menu_box_x4, 1, offset_x, offset_y, box_w, box_h);

// Level Info Container Box
var offset_x	= uc_get_view_x() + (box*2 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*6 + 1)*4 + (box/2)*4;
var box_w		= (box*6 - 1)*4;
var box_h		= (box*2 - 1)*4;
draw_sprite_stretched(spr_menu_box_x4, 1, offset_x, offset_y, box_w, box_h);

//// Primary Objective Box
//var offset_x	= uc_get_view_x() + (box*2 + 3)*4 + (box/2)*4;
//var offset_y	= uc_get_view_y() + (box*6 + 3)*4 + (box/2)*4;
//var box_w		= (box*4 - 3)*4;
//var box_h		= (box*1 - 3)*4;
//draw_sprite_stretched(spr_menu_box_x4, 1, offset_x, offset_y, box_w, box_h);

//// Secondary Objective Box
//var offset_x	= uc_get_view_x() + (box*2 + 3)*4 + (box/2)*4;
//var offset_y	= uc_get_view_y() + (box*7 + 1)*4 + (box/2)*4;
//var box_w		= (box*4 - 3)*4;
//var box_h		= (box*1 - 3)*4;
//draw_sprite_stretched(spr_menu_box_x4, 1, offset_x, offset_y, box_w, box_h);

// Options Container Box
var offset_x	= uc_get_view_x() + (box*0 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*0 + 1)*4 + (box/2)*4;
var box_w		= (box*1 - 1)*4;
var box_h		= (box*8 - 1)*4;
draw_sprite_stretched(spr_menu_box_x4, 2, offset_x, offset_y, box_w, box_h);

// Options Box
var offset_x	= uc_get_view_x() + (box*0 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*0 + 1)*4 + (box/2)*4;
var box_w		= (box*1 - 1)*4;
var box_h		= (box*1 - 1)*4;
draw_sprite_stretched(spr_menu_box_x4, 2, offset_x, offset_y, box_w, box_h);

// Options Box
var offset_x	= uc_get_view_x() + (box*0 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*1 + 1)*4 + (box/2)*4;
var box_w		= (box*1 - 1)*4;
var box_h		= (box*1 - 1)*4;
draw_sprite_stretched(spr_menu_box_x4, 2, offset_x, offset_y, box_w, box_h);

// Options Box
var offset_x	= uc_get_view_x() + (box*0 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*2 + 1)*4 + (box/2)*4;
var box_w		= (box*1 - 1)*4;
var box_h		= (box*1 - 1)*4;
draw_sprite_stretched(spr_menu_box_x4, 2, offset_x, offset_y, box_w, box_h);

// Options Box
var offset_x	= uc_get_view_x() + (box*0 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*3 + 1)*4 + (box/2)*4;
var box_w		= (box*1 - 1)*4;
var box_h		= (box*1 - 1)*4;
draw_sprite_stretched(spr_menu_box_x4, 2, offset_x, offset_y, box_w, box_h);

// Options Box
var offset_x	= uc_get_view_x() + (box*0 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*4 + 1)*4 + (box/2)*4;
var box_w		= (box*1 - 1)*4;
var box_h		= (box*1 - 1)*4;
draw_sprite_stretched(spr_menu_box_x4, 2, offset_x, offset_y, box_w, box_h);



#region
// Ship Selection Boxes
var offset_x	= uc_get_view_x() + (box*9 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*0 + 1)*4 + (box/2)*4;
var box_w		= (box*1 - 1 + 4)*4;
var box_h		= (box*1 - 1)*4;
for (var i = 0; i < 4; ++i) {
	draw_sprite_stretched(spr_menu_box_x4, 1, offset_x, offset_y + (box*i*4), box_w, box_h);
}

// Ship Selection Icons
var offset_x	= uc_get_view_x() + (box*9 + 2)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*0 + 0)*4 + (box/2)*4;
for (var i = 0; i < 4; ++i) {
	draw_sprite_ext(spr_menu_ship_selection, i, offset_x, offset_y + (box*i*4), 1, 1, 0, -1, 0.6);
}

// Ship Info Container
var offset_x	= uc_get_view_x() + (box*10+ 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*0 + 1)*4 + (box/2)*4;
var box_w		= (box*5 - 1)*4;
var box_h		= (box*8 - 1)*4;
draw_sprite_stretched(spr_menu_box_x4, 1, offset_x, offset_y, box_w, box_h);


// Ship Icon Box
var offset_x	= uc_get_view_x() + (box*11+ 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*1 + 1)*4 + (box/2)*4;
var box_w		= (box*3 - 1)*4;
var box_h		= (box*2 - 1)*4;
draw_sprite_stretched(spr_menu_box_x4, 2, offset_x, offset_y, box_w, box_h);

// Ship Icon
var offset_x	= uc_get_view_x() + (box*11+ 1-1)*4 - 2 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*1 + 1-1)*4 - 2 + (box/2)*4;
if (ship_selection_boxes[0].selected == true) {
    draw_sprite_ext(spr_menu_ship, 0, offset_x, offset_y, 2, 2, 0, -1, 1);
}
if (ship_selection_boxes[1].selected == true) {
    draw_sprite_ext(spr_menu_ship, 1, offset_x, offset_y, 2, 2, 0, -1, 1);
}
if (ship_selection_boxes[2].selected == true) {
    draw_sprite_ext(spr_menu_ship, 2, offset_x, offset_y, 2, 2, 0, -1, 1);
}
if (ship_selection_boxes[3].selected == true) {
    draw_sprite_ext(spr_menu_ship, 3, offset_x, offset_y, 2, 2, 0, -1, 1);
}

// Ship Name Box
var offset_x	= uc_get_view_x() + (box*11+ 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*3 + 1)*4 + (box/2)*4;
var box_w		= (box*3 - 1)*4;
var box_h		= (box*1 - 1)*4;
draw_sprite_stretched(spr_menu_box_x4, 2, offset_x, offset_y, box_w, box_h);
#endregion

// Ship Name Text
draw_set_font(fnt_poco_title);
draw_set_halign(fa_middle);
draw_set_valign(fa_top);
var text_offset_x = uc_get_view_x() + (box*12+ box/2 + 1)*4 + (box/2)*4;
var text_offset_y = uc_get_view_y() + (box*3 - 0.5)*4	    + (box/2)*4;
var text_w = (box*3 - 8)*4 -1;
var text_h = 28;
var string_info = "";
if (ship_selection_boxes[0].selected == true) {
    var string_info = "SQUIRE";
}
if (ship_selection_boxes[1].selected == true) {
    var string_info = "GOLIATH";
}
if (ship_selection_boxes[2].selected == true) {
    var string_info = "BASILISK";
}
if (ship_selection_boxes[3].selected == true) {
    var string_info = "ARTEMIS";
}
draw_text_ext_transformed_colour(text_offset_x, text_offset_y, string_info, text_h, text_w, 1, 1, 0, c_white, c_white, c_white, c_white, 1);


draw_set_font(fnt_poco);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var text_offset_x = uc_get_view_x() + (box*10+ 5)*4 + (box/2)*4;
var text_offset_y = uc_get_view_y() + (box*4 + 1)*4 + (box/2)*4;
var text_w = (box*5 - 8)*4 -1 + 1;
var text_h = 24;
var string_info_1 = "";
var string_info_2 = "";
var string_info_3 = "";
if (ship_selection_boxes[0].selected == true) {
	var string_info_1 = "- ALL-ROUNDER VESSEL";
	var string_info_2 = "\n- CAN ACQUIRE STACKABLE POWERUPS FROM ENEMIES \n- POTENTIAL TO 'SNOWBALL' FROM POWERUPS, BECOMING UNSTOPABLE";
	var string_info_3 = "\n\n\n\n\n\n- POOR DAMAGE WITHOUT POWERUP BONUSES";
}
if (ship_selection_boxes[1].selected == true) {
	var string_info_1 = "- TANK VESSEL";
	var string_info_2 = "\n- LARGE HP POOL \n- POWERFUL CANNON \n- PIERCING BULLETS";
	var string_info_3 = "\n\n\n\n- SLOW MOVEMENT \n- SLOW RATE OF FIRE";
}
if (ship_selection_boxes[2].selected == true) {
	var string_info_1 = "- ROCKET VESSEL \n- FLIGHT-BASED MOVEMENT";
	var string_info_2 = "\n\n- CAN SWITCH BETWEEN 3 ROCKET TYPES: \n	BLAST ROCKET (FAST)\n	HOMING ROCKET (ACCURATE) \n	MULTI ROCKET (RANDOM)";
	var string_info_3 = "\n\n\n\n\n\n\n- DIFFICULT COMBAT USEABILITY";
}
if (ship_selection_boxes[3].selected == true) {
	var string_info_1 = "- RAMMING VESSEL";
	var string_info_2 = "\n- CAN CHARGE 'BOOST MODE' TO SLINGSHOT INTO ENEMIES \n- COLLISION DAMAGE IMMUNITY \n- PROJECTILE DAMAGE IMMUNITY (ONLY WHEN BOOSTING)";
	var string_info_3 = "\n\n\n\n\n\n- LOW HP \n- NO RANGED WEAPON \n- NO SHIELD MODULE";
}
draw_text_ext_transformed_colour(text_offset_x, text_offset_y, string_info_1, text_h, text_w, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
draw_text_ext_transformed_colour(text_offset_x, text_offset_y, string_info_2, text_h, text_w, 1, 1, 0, c_green, c_green, c_green, c_green, 1);
draw_text_ext_transformed_colour(text_offset_x, text_offset_y, string_info_3, text_h, text_w, 1, 1, 0, c_red, c_red, c_red, c_red, 1);
