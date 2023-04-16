/// @description Create Level Grid Array

// Initialise grid variables.
level_grid_size	= 10;
level_cell_size	= Camera.camera_width;
level_grid	= ds_grid_create(level_grid_size, level_grid_size);

// Iterate through every cell in the grid array.
for (var grid_y = 0; grid_y < level_grid_size; grid_y += 1) {
	for (var grid_x = 0; grid_x < level_grid_size; grid_x += 1) {
		// Reset the cell so its data can be overwritten.
		var grid_cell = [[]];	
		
		// Determine the XY boundaries of the cell.
		var cell_boundaries = [
			grid_x * level_cell_size,
			grid_y * level_cell_size,
			grid_x * level_cell_size + level_cell_size, 
			grid_y * level_cell_size + level_cell_size];
		
		// Append the cell boundaries to grid cell.
		array_set(grid_cell, 0, cell_boundaries);
		
		// Set various flags to false.
		var player_occupy	= false;
		var player_visit	= false;
		var cell_loaded		= false;
		array_push(grid_cell, player_occupy, player_visit, cell_loaded);
		
		// Rewrite the grid cell with new data.
		ds_grid_set(level_grid, grid_x, grid_y, grid_cell);
	}
}

// Adjust room width and height.
room_width	= level_grid_size * level_cell_size;
room_height = level_grid_size * level_cell_size;


// Initialise player variables.
var starting_x = 320;
var starting_y = 320;
//var selected_ship = obj_ship_squire;
var selected_ship = obj_ship_goliath;
//var selected_ship = obj_ship_basilisk;
//var selected_ship = obj_ship_artemis;
//var selected_ship = obj_ship_magus;

// Create the selected player ship.
instance_create_layer(starting_x, starting_y, "Instances", selected_ship);

uc_add_instance_following_list(obj_faction_player);
//uc_set_mode()

/*
This loop will only occur once to prevent enemies from 
being spawned in or adjacent to the player's starting cell.
*/
// Loop through each cell and update values for cell_loaded.
for (var grid_y = 0; grid_y < level_grid_size; grid_y += 1) {
	for (var grid_x = 0; grid_x < level_grid_size; grid_x += 1) {
		// Copy the cell so all its data can be overwritten/expanded.
		var grid_cell = ds_grid_get(level_grid, grid_x, grid_y);
		
		// Determine if player is within the confines of this grid cell.
		var check_cell = point_in_rectangle(
			obj_faction_player.x, obj_faction_player.y,
			ds_grid_get(level_grid, grid_x, grid_y)[0][0], 
			ds_grid_get(level_grid, grid_x, grid_y)[0][1],
			ds_grid_get(level_grid, grid_x, grid_y)[0][2],
			ds_grid_get(level_grid, grid_x, grid_y)[0][3]);

		// If true, loop through all adjacent cells in a 3x3 square.
		if (check_cell == true && grid_cell[2] == false) {
			for (var i1 = -1; i1 < 2; i1 += 1) {
				// Continue for loop if grid_y + i1 is out of bounds.
				if (grid_y + i1 < 0 || grid_y + i1 > ds_grid_height(level_grid)-1) {continue;}				
				for (var i2 = -1; i2 < 2; i2 += 1) {
					// Continue for loop if grid_x + i2 is out of bounds.
					if (grid_x + i2 < 0 || grid_x + i2 > ds_grid_width(level_grid)-1) {continue;}
					
					// Copy the cell so all its data can be overwritten/expanded.
					var grid_cell = ds_grid_get(level_grid, grid_x+i2, grid_y+i1);
					
					// If cell_loaded is false, overwrite cell_loaded in grid cell andspawnspawnspawnadnasjdn212354564
					if (grid_cell[3] == false) {
						grid_cell[3] = true;
						ds_grid_set(level_grid, grid_x+i2, grid_y+i1, grid_cell);
					}
				}
			}
		}
	}
}




// Initialise Minimap Variables ///////////////////////////////////////////////
minimap_surface		= -1;
proportion			= 40;
surface_width		= 160;
surface_scale		= 2;
minimap_cell_width	= level_cell_size / proportion;
minimap_grid_width	= minimap_cell_width * level_grid_size;
minimap_offset		= Camera.camera_height/2 - surface_width;
minimap_offset		= Camera.camera_height/2 + surface_width/2;
minimap_target		= obj_faction_player;


