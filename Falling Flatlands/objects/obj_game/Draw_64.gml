/// @description Draw Minimap


// Draw minimap border.
draw_circle_colour(2 + surface_width/2, -4 + surface_width/2 + minimap_offset, surface_width/2 + 2, c_white, c_white, false);
// Draw minimap backdrop.
draw_circle_colour(2 + surface_width/2, -4 + surface_width/2 + minimap_offset, surface_width/2, c_black, c_black, false);

// Recreate Surfaces //////////////////////////////////////////////////////////
// In the event of a memory leak or buffer, recreate surfaces.
if (!surface_exists(minimap_surface)) {
	minimap_surface = surface_create(surface_width*4, surface_width*4);
	view_surface_id[1] = minimap_surface;	
}

// Set Up & Draw Surfaces /////////////////////////////////////////////////////
// Set the target surface to draw onto.
surface_set_target(minimap_surface);

// Draw minimap surface backdrop.
draw_rectangle_color(0, 0, minimap_grid_width*4, minimap_grid_width*4, c_black, c_black, c_black, c_black, false);

// Draw minimap grid.
for (var i = 0; i < level_grid_size+1; i += 1) {	
	// Draw Horizontal Lines
	draw_line_width(
		(-(minimap_target.x/proportion*surface_scale) + minimap_grid_width*(0.5/(level_grid_size/10)))*4,
		(-(minimap_target.y/proportion*surface_scale) + minimap_grid_width*(0.5/(level_grid_size/10)) + i*minimap_cell_width*surface_scale)*4, 
		(-(minimap_target.x/proportion*surface_scale) + minimap_grid_width*(0.5/(level_grid_size/10)  + 1.0*surface_scale))*4,
		(-(minimap_target.y/proportion*surface_scale) + minimap_grid_width*(0.5/(level_grid_size/10)) + i*minimap_cell_width*surface_scale)*4,
		4);
		
	// Draw Vertical Lines
	draw_line_width(
		(-(minimap_target.x/proportion*surface_scale) + minimap_grid_width*(0.5/(level_grid_size/10)) + i*minimap_cell_width*surface_scale)*4,
		(-(minimap_target.y/proportion*surface_scale) + minimap_grid_width*(0.5/(level_grid_size/10)))*4, 
		(-(minimap_target.x/proportion*surface_scale) + minimap_grid_width*(0.5/(level_grid_size/10)) + i*minimap_cell_width*surface_scale)*4,
		(-(minimap_target.y/proportion*surface_scale) + minimap_grid_width*(0.5/(level_grid_size/10)  + 1.0*surface_scale))*4,
		4);
}


// Draw grid square colours.
for (var grid_y = 0; grid_y < level_grid_size; grid_y += 1) {
	for (var grid_x = 0; grid_x < level_grid_size; grid_x += 1) {	
		// Get grid cell.
		var grid_cell = ds_grid_get(level_grid, grid_x, grid_y);
		
		for (var i = 1; i < 4; i += 1) {		
			// If grid_cell[i] is true, draw a coloured square at grid_cell coordinates.
			if (grid_cell[i] == true) {
				// Set colouring and alpha blending based on i.
				switch (i) {
					case 1:
						var cell_colour	= c_orange;
						var cell_alpha	= 0.75;
						break;
					case 2:
						var cell_colour	= c_orange;
						var cell_alpha	= 0.5;
						break;
					case 3:
						var cell_colour	= c_gray;
						var cell_alpha	= 0.5;
						break;
				}
				
				// Draw coloured square.
				draw_set_alpha(cell_alpha);
				draw_rectangle_color(
					floor(minimap_grid_width*(0.5/(level_grid_size/10)) - floor(minimap_cell_width*surface_scale*(minimap_target.x/level_cell_size) - (minimap_cell_width*surface_scale*grid_x)))*4, 
					floor(minimap_grid_width*(0.5/(level_grid_size/10)) - floor(minimap_cell_width*surface_scale*(minimap_target.y/level_cell_size) - (minimap_cell_width*surface_scale*grid_y)))*4, 
					floor(minimap_grid_width*(0.5/(level_grid_size/10)) - floor(minimap_cell_width*surface_scale*(minimap_target.x/level_cell_size) - (minimap_cell_width*surface_scale*grid_x)) + minimap_cell_width*surface_scale)*4, 
					floor(minimap_grid_width*(0.5/(level_grid_size/10)) - floor(minimap_cell_width*surface_scale*(minimap_target.y/level_cell_size) - (minimap_cell_width*surface_scale*grid_y)) + minimap_cell_width*surface_scale)*4, 
					cell_colour, cell_colour, cell_colour, cell_colour, false);
				draw_set_alpha(1.0);
				break;
			}		
		}	
	}
}

// Draw player icon (blue circle)
draw_circle_colour(
	(surface_width/2)*4, 
	(surface_width/2)*4, 
	2*4, c_blue, c_blue, false);
	
// Draw enemy icons (red circle)
for (var i = 0; i < instance_number(obj_faction_enemy); i += 1) {
	var target_iteration= instance_find(obj_faction_enemy, i);
	var target_distance	= point_distance(minimap_target.x, minimap_target.y, target_iteration.x, target_iteration.y);
	var target_direction= point_direction(minimap_target.x, minimap_target.y, target_iteration.x, target_iteration.y);
	draw_circle_colour(
		(surface_width/2 + lengthdir_x(target_distance, target_direction)/20)*4,
		(surface_width/2 + lengthdir_y(target_distance, target_direction)/20)*4,
		2*4, c_red, c_red, false);	
}

	


// Disable some GPU stuff I don't understand.
gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);

// Draw the rectangular border with 0 alpha blending (invisible borders).
draw_set_alpha(0);
draw_rectangle(0, 0, surface_width*4, surface_width*4, false);
draw_set_alpha(1);

// Draw the circular window to overlap and hide everything outside of its radius.
draw_circle(2 + surface_width/2*4, 2 + surface_width/2*4, (surface_width/2 - 1)*4, false);

// Re-enable the GPU stuff I don't understand.
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);

// Reset the target surface, to the game can go back to drawing everything else normally.
surface_reset_target();

// Draw Surface (Popup Window)
if (view_visible[1]) {
	draw_surface_ext(minimap_surface, 2, -4 + minimap_offset, 0.25, 0.25, 0, -1, 1);
}