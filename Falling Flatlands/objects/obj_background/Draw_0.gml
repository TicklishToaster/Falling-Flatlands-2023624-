/// @description Insert description here
// You can write your code in this editor

//draw_sprite_ext(spr_rectangle, -1, )


// Recreate Surfaces //////////////////////////////////////////////////////////
// In the event of a memory leak or buffer, recreate surfaces.
if (!surface_exists(background_surface)) {
	background_surface = surface_create(room_width, room_height);
	//view_surface_id[1] = background_surface;
	
	// Set Up & Draw Surfaces /////////////////////////////////////////////////////
	// Set the target surface to draw onto.
	surface_set_target(background_surface);


	for (var xx = 0; xx < room_width/box_size; ++xx) {
		for (var yy = 0; yy < room_height/box_size; ++yy) {
			draw_set_alpha(1);
			draw_set_alpha(random_range(0.2, 0.6));
			//draw_set_alpha(random_range(0.2, 0.4));
			draw_rectangle_color(
				xx * box_size, 
				yy * box_size, 
				xx * box_size+box_size, 
				yy * box_size+box_size, 
				c_white, c_white, c_white, c_white, false);
			
			draw_set_alpha(random_range(0.2, 0.6));
			//draw_set_alpha(random_range(0.2, 0.4));
			draw_rectangle_color(
				xx * box_size + 2, 
				yy * box_size + 2, 
				xx * box_size+box_size - 2, 
				yy * box_size+box_size - 2, 
				c_black, c_black, c_black, c_black, false);
		}
	}
	draw_set_alpha(1);
	surface_reset_target();	
}

//// Set Up & Draw Surfaces /////////////////////////////////////////////////////
//// Set the target surface to draw onto.
//surface_set_target(background_surface);


//for (var xx = 0; xx < room_width/box_size; ++xx) {
//	for (var yy = 0; yy < room_height/box_size; ++yy) {
//	    // code here
//		draw_set_alpha(random_range(0.2, 0.6));
//		draw_rectangle_color(xx, yy, xx+box_size, yy+box_size, c_white, c_white, c_white, c_white, false);
//		//draw_rectangle_color(xx, yy, xx+box_size, yy+box_size, c_white, c_white, c_white, c_white, false);
//	}
//}

//draw_set_alpha(1);

//surface_reset_target();

draw_surface_general(background_surface, 0, 0, 
	room_width, room_height, 0, 0, 
	1, 1, 0, 
	bg_colour_1, bg_colour_2, bg_colour_3, bg_colour_4, 1);
