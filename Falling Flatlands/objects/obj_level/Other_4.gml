/// @description Create Level Grid Array

// Initialise Level Grid //////////////////////////////////////////////////////
// Initialise grid variables.
level_grid_size	= level_size;
//level_cell_size	= 640;
//level_cell_size	= Camera.camera_width;
level_cell_size	= 1280;
level_grid	= ds_grid_create(level_grid_size, level_grid_size);

// Adjust room width and height.
room_width	= level_grid_size * level_cell_size;
room_height = level_grid_size * level_cell_size;

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
		array_set(grid_cell, 0, cell_boundaries); //grid_cell[i][0]
		
		// Set various flags to false.
		var player_occupy	= false;
		var player_visit	= false;
		var cell_loaded		= false;
		array_push(grid_cell, player_occupy);	//grid_cell[i][1]
		array_push(grid_cell, player_visit);	//grid_cell[i][2]
		array_push(grid_cell, cell_loaded);		//grid_cell[i][3]
		
		// Set a random objective weighting and objective flag to the grid cell.
		var objective_weight	= irandom_range(1, 9);
		var objective_set		= "";
		array_push(grid_cell, objective_weight);	//grid_cell[i][4]
		array_push(grid_cell, objective_set);		//grid_cell[i][5]
		
		// Rewrite the grid cell with new data.
		ds_grid_set(level_grid, grid_x, grid_y, grid_cell);
	}
}


// Initialise Player Variables ////////////////////////////////////////////////
var cell_x = irandom_range(1, level_grid_size-1-1);
var cell_y = irandom_range(1, level_grid_size-1-1);

// Copy the cell so all its data can be overwritten/expanded.
var grid_cell = ds_grid_get(level_grid, cell_x, cell_y);
grid_cell[5] = "Spawn";
ds_grid_set(level_grid, cell_x, cell_y, grid_cell);
var starting_x = cell_x * level_cell_size + (level_cell_size/2);
var starting_y = cell_y * level_cell_size + (level_cell_size/2);

// Create the selected player ship.
instance_create_layer(starting_x, starting_y, "Instances", player_ship);
uc_add_instance_following_list(obj_faction_player);
Camera.x = Camera.target_x;
Camera.y = Camera.target_y;

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

// Initialise Win Condition Variables /////////////////////////////////////////
// Initialise the level exit cell.
if (condition_win_portal) {
	var cell_x = irandom_range(1, level_grid_size-1-1);
	var cell_y = irandom_range(1, level_grid_size-1-1);
	var loop_exit = false;

	// Ensure the exit cell has a valid placement.
	while (loop_exit == false) {
		loop_exit = true;
		// Determine if the player spawn cell is within a 2 cell radius of the target cell.
		for (var grid_y = -2; grid_y < 3; grid_y += 1) {
			for (var grid_x = -2; grid_x < 3; grid_x += 1) {
				// Copy the cell data into variable.
				var grid_cell = ds_grid_get(level_grid, clamp(cell_x + grid_x, 0, level_grid_size-1), clamp(cell_y + grid_y, 0, level_grid_size-1));
			
				// If the player spawn cell is within range of target cell.
				if (grid_cell[5] != "") {
				    // Reset loop exit and randomise a new target cell.
					loop_exit = false;
					cell_x = irandom_range(1, level_grid_size-1-1);
					cell_y = irandom_range(1, level_grid_size-1-1);
					break;
				}
			}
		}
	
		// If the target cell is not near or in the player spawn cell.
		if (loop_exit == true) {
			// Copy the cell so all its data can be overwritten/expanded.
			var grid_cell = ds_grid_get(level_grid, cell_x, cell_y);
			grid_cell[5] = "Exit";
			ds_grid_set(level_grid, cell_x, cell_y, grid_cell);	
		
			var exit_x = cell_x * level_cell_size + (level_cell_size/2);
			var exit_y = cell_y * level_cell_size + (level_cell_size/2);
		
			var objective_object = instance_create_layer(exit_x, exit_y, "Instances", obj_exit_portal);
		}
	}
}

// Initialise level key cell(s).
if (condition_win_key) {
	repeat (condition_key_number_max) {
		// Initialise the level key cell locations.
		var cell_x = irandom_range(1, level_grid_size-1-1);
		var cell_y = irandom_range(1, level_grid_size-1-1);
		var loop_exit = false;
		var loop_count = 0;

		// Ensure the exit cell has a valid placement.
		while (loop_exit == false) {
			loop_count += 1;
			loop_exit = true;
			// Determine if the player spawn cell is within a 2 cell radius of the target cell.
			for (var grid_y = -2; grid_y < 3; grid_y += 1) {
				for (var grid_x = -2; grid_x < 3; grid_x += 1) {
					// Copy the cell data into variable.
					var grid_cell = ds_grid_get(level_grid, clamp(cell_x + grid_x, 0, level_grid_size-1), clamp(cell_y + grid_y, 0, level_grid_size-1));
			
					// If the player spawn cell is within range of target cell.
					if (grid_cell[5] != "") {
					    // Reset loop exit and randomise a new target cell.
						loop_exit = false;
						cell_x = irandom_range(1, level_grid_size-1-1);
						cell_y = irandom_range(1, level_grid_size-1-1);
						break;
					}
				}
			}
	
			// If the target cell is not near or in the player spawn cell.
			if (loop_exit == true || loop_count >= 128) {
				// Copy the cell so all its data can be overwritten/expanded.
				var grid_cell = ds_grid_get(level_grid, cell_x, cell_y);
				grid_cell[5] = "Key";
				ds_grid_set(level_grid, cell_x, cell_y, grid_cell);	
		
				var exit_x = cell_x * level_cell_size + (level_cell_size/2);
				var exit_y = cell_y * level_cell_size + (level_cell_size/2);
		
				var objective_object = instance_create_layer(exit_x, exit_y, "Instances", obj_key);
				array_push(condition_key_list, objective_object);			
			}
		}
	}
}


// Initialise Minimap Variables ///////////////////////////////////////////////
minimap_surface		= -1;
proportion			= 80; //this value should be 40 when the cell size is 640, 80 when the cell size is 1280, etc.
surface_width		= 160;
surface_scale		= 2; //3
minimap_cell_width	= level_cell_size / proportion;
minimap_grid_width	= minimap_cell_width * level_grid_size;
minimap_offset		= Camera.camera_height/2 - surface_width;
minimap_offset		= Camera.camera_height/2 + surface_width/2;
minimap_target		= obj_faction_player;


// Initialise Background //////////////////////////////////////////////////////
instance_create_layer(x, y, "Tile_Background", obj_background);