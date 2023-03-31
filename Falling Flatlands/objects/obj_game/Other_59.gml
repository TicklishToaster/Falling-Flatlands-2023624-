/// @description OLD
// You can write your code in this editor



		////ds_grid_set(level_grid, grid_x, grid_y, string("[" + string(grid_x) + ", " + string(grid_y) + "]"));
		
		//var grid_cell	= ds_grid_get(level_grid, grid_x, grid_y);
		//var xy_co		= [grid_x+1, grid_y+1];
		////var xy_co		= string("[" + string(grid_x) + ", " + string(grid_y) + "]")
		//ds_grid_set(level_grid, grid_x, grid_y, array_push(grid_cell, xy_co));
		
		
		//var grid_cell	= ds_grid_get(level_grid, grid_x, grid_y);
		
		//var cell_boundaries = [
		//	grid_x * level_cell_size,
		//	grid_y * level_cell_size,
		//	grid_x * level_cell_size + level_cell_size, 
		//	grid_y * level_cell_size + level_cell_size];
		
		//ds_grid_set(level_grid, grid_x, grid_y, cell_boundaries);
		
		//var grid_cell	= [[]];
		//var xy_co		= [grid_x+1, grid_y+1];
		//array_set(grid_cell, 0, xy_co);
		
		
//switch(room){
//	case rm_game:
//		//draw_sprite_ext(spr_ship, 0, Camera.camera_width-20, 40-10, 0.5, 0.5, 0, c_white, 1);
//		draw_text(Camera.camera_width-50, 10-2, string(lives));
//		draw_text(Camera.camera_height-200, 10-2, string(score)+" ");
//		break;
		
//	case rm_start:
//		draw_set_halign(fa_center);
//		var c = c_yellow;		
//		draw_text_transformed_color(room_width/2, 100, "SPACE ROCKS", 2, 2, 0, c, c, c, c, 1);
//		draw_text(
//			room_width/2, 200, 
//			"Score 1,000 points!\n"+
//			"\n"+
//			"W/S: Move Forward/Backward\n"+
//			"A/D: Turn Left/Right\n"+
//			"SPACE: Shoot\n"+
//			"SHIFT: SHIELD\n"+
//			"MOUSE 1: GRAPPLE\n"+
//			"\n"+
//			">> PRESS ENTER TO START <<\n"+
//			">> PRESS ESCAPE TO QUIT <<"
//		);
//		draw_set_halign(fa_left);
//		break;
		
//	case rm_win:
//		draw_set_halign(fa_center);
//		var c = c_lime;
//		draw_text_transformed_color(room_width/2, 200, "WIN", 3, 3, 0, c, c, c, c, 1);
//		draw_text(room_width/2, 300, "PRESS ENTER TO RESTART");
//		draw_set_halign(fa_left);	
//		break;
		
//	case rm_gameover:
//		draw_set_halign(fa_center);
//		var c = c_red;
//		draw_text_transformed_color(room_width/2, 150, "GAME OVER", 3, 3, 0, c, c, c, c, 1);
//		draw_text(room_width/2, 250, "FINAL SCORE: " + string(score));
//		draw_text(room_width/2, 300, "PRESS ENTER TO RESTART");		
//		draw_set_halign(fa_left);	
//		break;		
//}	



	//draw_line(i*minimap_size, 0, i*minimap_size, level_grid_size*minimap_size);
	//draw_line(0, i*minimap_size, level_grid_size*minimap_size, i*minimap_size);
	//draw_line(
	//	(target.x/n) + i*minimap_size, 
	//	(target.y/n) + 0, 
	//	(target.x/n) + i*minimap_size,
	//	(target.y/n) + level_grid_size*minimap_size);
	//draw_line(
	//	(target.x/n) + 0, 
	//	(target.y/n) + i*minimap_size, 
	//	(target.x/n) + level_grid_size*minimap_size, 
	//	(target.y/n) + i*minimap_size);
	
	//// Horizontal Lines
	//draw_line(
	//	0, 
	//	i*minimap_size, 
	//	level_grid_size*minimap_size, 
	//	i*minimap_size);	
	
	//// Vertical Lines
	//draw_line(
	//	(target.x/n) - (minimap_width/2) + i*minimap_size,
	//	(target.y/n) - (minimap_width/2), 
	//	(target.x/n) - (minimap_width/2) + i*minimap_size,
	//	(target.y/n) - (minimap_width/2) + minimap_width);

	//// Horizontal Lines
	//draw_line(
	//	(target.x/n) - (minimap_width/2),
	//	(target.y/n) - (minimap_width/2) + i*minimap_size, 
	//	(target.x/n) - (minimap_width/2) + minimap_width,
	//	(target.y/n) - (minimap_width/2) + i*minimap_size);
	
	//// Horizontal Lines
	//draw_line(
	//	(target.x/n) - 0,
	//	(target.y/n) + i*minimap_size, 
	//	(target.x/n) + 0,
	//	(target.y/n) + i*minimap_size);
		
	//// Horizontal Lines
	//draw_line(
	//	(target.x/n) + i*minimap_size,
	//	(target.y/n) - 0, 
	//	(target.x/n) + i*minimap_size,
	//	(target.y/n) + 0);	

	//// Horizontal Lines
	//draw_line(
	//	-minimap_width/2,
	//	-minimap_width/2 + i*minimap_size, 
	//	+minimap_width/2,
	//	-minimap_width/2 + i*minimap_size);
		
	//// Horizontal Lines
	//draw_line(
	//	-minimap_width/2 + i*minimap_size,
	//	-minimap_width/2, 
	//	-minimap_width/2 + i*minimap_size,
	//	+minimap_width/2);
	
	
/// @description Insert description here
// You can write your code in this editor


//show_debug_message("");
//show_debug_message("LEVEL GRID:");

//var minimap_size = level_cell_size/100;
//var minimap_size = level_cell_size / 40;
//var minimap_offset_y = level_cell_size - minimap_size * level_grid_size-2;

//for (var i = 0; i < level_grid_size; i += 1) {
//	draw_line(i*minimap_size, minimap_offset_y, i*minimap_size, minimap_offset_y + level_grid_size*minimap_size);
//	draw_line(0, minimap_offset_y + i*minimap_size, level_grid_size*minimap_size, minimap_offset_y + i*minimap_size);
//}

//draw_line_width(0, minimap_offset_y, 0, minimap_offset_y + level_grid_size*minimap_size, 2);
//draw_line_width(level_grid_size*minimap_size, minimap_offset_y, level_grid_size*minimap_size, minimap_offset_y + level_grid_size*minimap_size, 2);
//draw_line_width(0, minimap_offset_y, level_grid_size*minimap_size, minimap_offset_y, 2);
//draw_line_width(0, minimap_offset_y + level_grid_size*minimap_size, level_grid_size*minimap_size, minimap_offset_y + level_grid_size*minimap_size, 2);



//for (var grid_y = 0; grid_y < level_grid_size; grid_y += 1) {
//	for (var grid_x = 0; grid_x < level_grid_size; grid_x += 1) {
		
//		var grid_cell = ds_grid_get(level_grid, grid_x, grid_y);		
//		if (grid_cell[1] == true) {
//			draw_set_alpha(0.5)
//			draw_rectangle_color(
//				grid_x * minimap_size, 
//				grid_y * minimap_size + minimap_offset_y, 
//				grid_x * minimap_size + minimap_size, 
//				grid_y * minimap_size + minimap_offset_y + minimap_size, 
//				c_gray, c_gray, c_gray, c_gray, false);
//			draw_set_alpha(1.0)
			
//			//draw_circle(
//			//	minimap_size/2 + grid_x * minimap_size, 
//			//	minimap_size/2 + minimap_offset_y + grid_y * minimap_size, 
//			//	3, false);
//		}
//	}
//}

//var target = obj_faction_player;
////var off_x = target.x - camera_get_view_x(view_camera[0]) // x is the normal x position
////var off_y = target.y - camera_get_view_y(view_camera[0]) // y is the normal y position
       
////// convert to gui
////var off_x_percent = off_x / camera_get_view_width(view_camera[0])
////var off_y_percent = off_y / camera_get_view_height(view_camera[0])
       
////var gui_x = off_x_percent * display_get_gui_width();
////var gui_y = off_y_percent * display_get_gui_height();

//////show_debug_message(room_width / level_cell_size / level_cell_size)
//////show_debug_message((room_width / level_cell_size) / 40)

////// convert to gui
////var gui_x = gui_x*20
////var gui_y = gui_y / level_cell_size/20

//draw_circle_colour(
//	target.x/40, 
//	target.y/40 + minimap_offset_y, 
//	//gui_y + 0, 
//	2, c_green, c_green, false);




//var minimap_size = level_cell_size / 40;
//var minimap_width = minimap_size * level_grid_size;
//var surface_offset = level_cell_size - minimap_size * level_grid_size;
////var surface_offset = 0;
////show_debug_message(minimap_width)
////var minimap_offset_y = level_cell_size - minimap_size * level_grid_size-2;
////minimap_offset_y = 0;

////var minimap_width = 160;

//var target = obj_faction_player;

////var surface_offset = level_cell_size - minimap_size * level_grid_size;

//// Draw minimap border
//draw_circle_colour(2 + minimap_width/2, -4 + minimap_width/2 + surface_offset, minimap_width/2 + 2, c_white, c_white, false);

//// Draw minimap backdrop
//draw_circle_colour(2 + minimap_width/2, -4 + minimap_width/2 + surface_offset, minimap_width/2, c_black, c_black, false);

//// Recreate Surfaces //////////////////////////////////////////////////////////
//// In the event of a memory leak or buffer, recreate surfaces.
//if (!surface_exists(minimap_surface)) {
//	//minimap_surface = surface_create(minimap_size*level_grid_size+2, minimap_size*level_grid_size+2);
//	minimap_surface = surface_create(minimap_width, minimap_width);
//	view_surface_id[1] = minimap_surface;	
//}

//// Set Up & Draw Surfaces /////////////////////////////////////////////////////
//// Set the target surface to draw onto.
//surface_set_target(minimap_surface);

////// Draw minimap border
////draw_circle_colour(minimap_width/2, minimap_width/2, minimap_width/2 + 2, c_white, c_white, false);

//// Draw minimap surface backdrop
////draw_circle_colour(minimap_width/2, minimap_width/2, minimap_width/2, c_black, c_black, false);
//draw_rectangle_color(0, 0, minimap_width, minimap_width, c_black, c_black, c_black, c_black, false);


//var n = 40;
//// Draw minimap grid
//for (var i = 0; i < level_grid_size+1; i += 1) {
//	var w = 0;
		
//	// Horizontal Lines
//	draw_line(
//		-(target.x/n) + minimap_width*0.5,
//		-(target.y/n) + minimap_width*0.5 + i*minimap_size, 
//		-(target.x/n) + minimap_width*1.5,
//		-(target.y/n) + minimap_width*0.5 + i*minimap_size);
		
//	// Horizontal Lines
//	draw_line(
//		-(target.x/n) + minimap_width*0.5 + i*minimap_size,
//		-(target.y/n) + minimap_width*0.5, 
//		-(target.x/n) + minimap_width*0.5 + i*minimap_size,
//		-(target.y/n) + minimap_width*1.5);
//}

////// Draw minimap borders
////draw_line_width(0, 0, 0, 0 + level_grid_size*minimap_size, 2);
////draw_line_width(level_grid_size*minimap_size, 0, level_grid_size*minimap_size, level_grid_size*minimap_size, 2);
////draw_line_width(0, 0, level_grid_size*minimap_size, 0, 2);
////draw_line_width(0, 0 + level_grid_size*minimap_size, level_grid_size*minimap_size, level_grid_size*minimap_size, 2);


//var n = 1;
//var w = level_cell_size;
//// Draw grey box
//for (var grid_y = 0; grid_y < level_grid_size; grid_y += 1) {
//	for (var grid_x = 0; grid_x < level_grid_size; grid_x += 1) {
//		var grid_cell = ds_grid_get(level_grid, grid_x, grid_y);		
//		if (grid_cell[1] == true) {
//			//show_debug_message((floor((target.x/n/w)*10)/10))
//			//show_debug_message(floor((target.x/n/w) + minimap_width*0.5))
//			//show_debug_message((target.x/n/w) + minimap_width*0.5)
//			//show_debug_message(floor(minimap_size*(target.x/n/w)) - (minimap_size*grid_x))
//			//show_debug_message((target.x/n)/w + minimap_width*0.5)
			
//			//show_debug_message(floor(target.x/w)*1 + floor(minimap_size*(floor((target.x/n/w)*10)/10))*0 + (minimap_size*grid_x))
//			//show_debug_message(floor(target.x/w) - floor(minimap_size*(target.x/w)) + (minimap_size*grid_x)*0)
			
			
//			//show_debug_message("GUD")
//			show_debug_message(floor((target.x/w)));
//			show_debug_message(floor(minimap_size*(target.x/w)) - (minimap_size*grid_x));
//			show_debug_message(floor(minimap_width*0.5 - (floor(minimap_size*(target.x/w)) - (minimap_size*grid_x))));
//			show_debug_message("GUD")
//			show_debug_message(floor(minimap_width*0.5));
//			show_debug_message(floor((target.x/n/w)));
//			show_debug_message(floor(minimap_size*(target.x/w)));
//			show_debug_message(floor(minimap_size*grid_x));
//			show_debug_message("NOT GUD")
			
//			draw_set_alpha(0.5)
//			draw_rectangle_color(
//				//((target.x/n)/level_grid_size) + grid_x * minimap_size, 
//				//((target.y/n)/level_grid_size) + grid_y * minimap_size, 
//				//((target.x/n)/level_grid_size) + grid_x * minimap_size + minimap_size, 
//				//((target.y/n)/level_grid_size) + grid_y * minimap_size + minimap_size, 
//				//(target.x/n)*w + minimap_width*0.5 + (grid_x * minimap_size), 
//				//(target.y/n)*w + minimap_width*0.5 + (grid_y * minimap_size), 
//				//(target.x/n)*w + minimap_width*0.5 + (grid_x * minimap_size + minimap_size), 
//				//(target.y/n)*w + minimap_width*0.5 + (grid_y * minimap_size + minimap_size), 
//				//floor((target.x/n)/w + minimap_width*0.5) + (1 * minimap_size) - floor(minimap_size*(target.x/n/w)) - (minimap_size*grid_x), 
//				//floor((target.y/n)/w + minimap_width*0.5) + (1 * minimap_size) - floor(minimap_size*(target.y/n/w)) - (minimap_size*grid_y), 
//				//floor((target.x/n)/w + minimap_width*0.5) + (1 * minimap_size + minimap_size) - floor(minimap_size*(target.x/n/w)) - (minimap_size*grid_x), 
//				//floor((target.y/n)/w + minimap_width*0.5) + (1 * minimap_size + minimap_size) - floor(minimap_size*(target.y/n/w)) - (minimap_size*grid_y), 
//				//floor((target.x/n/w) + minimap_width*0.5)*1 + floor(minimap_size*(target.x/n/w))*1 + (minimap_size*grid_x), 
//				//floor((target.y/n/w) + minimap_width*0.5)*1 + floor(minimap_size*(target.y/n/w))*1 + (minimap_size*grid_y), 
//				//floor((target.x/n/w) + minimap_width*0.5)*1 + floor(minimap_size*(target.x/n/w))*1 + (minimap_size*grid_x) + (1 * minimap_size), 
//				//floor((target.y/n/w) + minimap_width*0.5)*1 + floor(minimap_size*(target.y/n/w))*1 + (minimap_size*grid_y) + (1 * minimap_size), 
//				//floor((target.x/w))*1 - (floor(minimap_size*(target.x/w)) - (minimap_size*grid_x)) + (minimap_size*grid_x), 
//				//floor((target.y/w))*1 - (floor(minimap_size*(target.y/w)) - (minimap_size*grid_y)) + (minimap_size*grid_y), 
//				//floor((target.x/w))*1 - (floor(minimap_size*(target.x/w)) - (minimap_size*grid_x)) + (minimap_size*grid_x) + (1 * minimap_size), 
//				//floor((target.y/w))*1 - (floor(minimap_size*(target.y/w)) - (minimap_size*grid_y)) + (minimap_size*grid_y) + (1 * minimap_size), 
//				floor(minimap_width*0.5 - (floor(minimap_size*(target.x/w)) - (minimap_size*grid_x))), 
//				floor(minimap_width*0.5 - (floor(minimap_size*(target.y/w)) - (minimap_size*grid_y))), 
//				floor(minimap_width*0.5 - (floor(minimap_size*(target.x/w)) - (minimap_size*grid_x)) + (1 * minimap_size)), 
//				floor(minimap_width*0.5 - (floor(minimap_size*(target.y/w)) - (minimap_size*grid_y)) + (1 * minimap_size)), 
//				c_gray, c_gray, c_gray, c_gray, false);
//			draw_set_alpha(1.0)
//		}
//	}
//}


////// Draw green player circle
////draw_circle_colour(
////	target.x/20, 
////	target.y/20, 
////	2, c_green, c_green, false);

//// Draw green player circle
//draw_circle_colour(
//	minimap_width/2, 
//	minimap_width/2, 
//	2, c_green, c_green, false);




//// Disable some GPU stuff I don't understand.
//gpu_set_blendenable(false)
//gpu_set_colorwriteenable(false,false,false,true);

//// Draw the rectangular border with 0.0 alpha blending (invisible borders).
//draw_set_alpha(0);
//draw_rectangle(0, 0, minimap_width, minimap_width, false);
////draw_rectangle(-minimap_width/2, -minimap_width/2, minimap_width/2, minimap_width/2, false);
////draw_rectangle((target.x/n) - minimap_width/2, (target.y/n) - minimap_width/2, minimap_width, minimap_width, false);
//draw_set_alpha(1);

//// Draw the circular window 
//draw_circle(minimap_width/2, minimap_width/2, minimap_width/2 - 1, false);
////draw_circle(0, 0, minimap_width/2, false);
////draw_circle((target.x/n), (target.y/n), minimap_width/2, false);

	
//// Re-enable the GPU stuff I don't understand.
//gpu_set_blendenable(true);
//gpu_set_colorwriteenable(true,true,true,true);

//// Reset the target surface, to the game can go back to drawing everything else normally.
//surface_reset_target();

//// Draw Surface (Popup Window)
////if (view_visible[1] && view_current == 0) {
//if (view_visible[1]) {
//	//var offset_y = level_cell_size - minimap_size * level_grid_size;
//	show_debug_message("YAS")
//	//draw_surface(minimap_surface, 0, minimap_offset_y-view_hport[1])
//	//draw_surface(minimap_surface, 0, minimap_offset_y)
//	draw_surface(minimap_surface, 2, -4 + surface_offset);
//	//draw_surface(minimap_surface, 0 + minimap_width/2, offset_y + minimap_width/2);
//}