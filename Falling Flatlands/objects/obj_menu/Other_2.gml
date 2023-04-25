
var box = 15;
// Create Ship Selection Boxes
var offset_x	= uc_get_view_x() + (box*9 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*0 + 1)*4 + (box/2)*4;
var box_w		= (box*1 - 1 + 3)*4;
var box_h		= (box*1 - 1)*4;
var ship_list	= [obj_ship_squire, obj_ship_goliath, obj_ship_basilisk, obj_ship_artemis];
for (var i = 0; i < array_length(ship_list); ++i) {
	var target_ship = ship_list[i];
	var current_box = instance_create_layer(offset_x, offset_y + (box*i*4), "Menu", obj_menu_button_ship_selection, 
		{box_width : box_w, box_height : box_h, icon_sub_img : i, ship_id : target_ship});
	array_push(ship_selection_boxes, current_box);
}


// Create Level Select Boxes
var offset_x	= uc_get_view_x() + (box*2 + 6)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*0 + 6)*4 + (box/2)*4;
var current_id	= 0;
for (var yy = 0; yy < 5; ++yy) {
	for (var xx = 0; xx < 5; ++xx) {
		current_id += 1;
		var current_box = instance_create_layer(offset_x + xx * (16+0)*4, offset_y + yy * (16+0)*4, "Menu", obj_menu_button_level_selection, 
			{level_id : current_id, box_width : (16-1)*4, box_height : (16-1)*4});
		array_push(level_selection_boxes, current_box);		
	}
}

// Create Primary Objective Box
var offset_x	= uc_get_view_x() + (box*2 + 3)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*6 + 3)*4 + (box/2)*4;
var box_w		= (box*4 - 3)*4;
var box_h		= (box*1 - 3)*4;
//draw_sprite_stretched(spr_menu_box_x4, 1, offset_x, offset_y, box_w, box_h);
instance_create_layer(offset_x, offset_y, "Menu", obj_menu_button_objective01, 
	{box_width : box_w, box_height : box_h});

// Create Secondary Objective Box
var offset_x	= uc_get_view_x() + (box*2 + 3)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*7 + 1)*4 + (box/2)*4;
var box_w		= (box*4 - 3)*4;
var box_h		= (box*1 - 3)*4;
//draw_sprite_stretched(spr_menu_box_x4, 1, offset_x, offset_y, box_w, box_h);
instance_create_layer(offset_x, offset_y, "Menu", obj_menu_button_objective02, 
	{box_width : box_w, box_height : box_h});


// Create Level Start Box
var offset_x	= uc_get_view_x() + (box*6 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*6 + 3)*4 + (box/2)*4;
var box_w		= (box*2 - 3)*4;
var box_h		= (box*1 - 3)*4;
instance_create_layer(offset_x, offset_y, "Menu", obj_menu_button_start, 
	{box_width : box_w, box_height : box_h});

// Create Level Exit Box
var offset_x	= uc_get_view_x() + (box*6 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*7 + 1)*4 + (box/2)*4;
var box_w		= (box*2 - 3)*4;
var box_h		= (box*1 - 3)*4;
instance_create_layer(offset_x, offset_y, "Menu", obj_menu_button_exit, 
	{box_width : box_w, box_height : box_h});



// Create Fullscreen Box
var offset_x	= uc_get_view_x() + (box*0 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*4 + 1)*4 + (box/2)*4;
var box_w		= (box*1 - 1)*4;
var box_h		= (box*1 - 1)*4;
instance_create_layer(offset_x, offset_y, "Menu", obj_menu_button_fullscreen, 
	{box_width : box_w, box_height : box_h});

// Create Controls Box
var offset_x	= uc_get_view_x() + (box*0 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*5 + 1)*4 + (box/2)*4;
var box_w		= (box*1 - 1)*4;
var box_h		= (box*1 - 1)*4;
instance_create_layer(offset_x, offset_y, "Menu", obj_menu_button_controls, 
	{box_width : box_w, box_height : box_h});

// Create Audio Box
var offset_x	= uc_get_view_x() + (box*0 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*6 + 1)*4 + (box/2)*4;
var box_w		= (box*1 - 1)*4;
var box_h		= (box*1 - 1)*4;
instance_create_layer(offset_x, offset_y, "Menu", obj_menu_button_audio, 
	{box_width : box_w, box_height : box_h});

// Create Quit Box
var offset_x	= uc_get_view_x() + (box*0 + 1)*4 + (box/2)*4;
var offset_y	= uc_get_view_y() + (box*7 + 1)*4 + (box/2)*4;
var box_w		= (box*1 - 1)*4;
var box_h		= (box*1 - 1)*4;
instance_create_layer(offset_x, offset_y, "Menu", obj_menu_button_quit, 
	{box_width : box_w, box_height : box_h});

