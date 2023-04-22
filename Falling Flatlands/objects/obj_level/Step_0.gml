/// @description Generate Level Grid Cells

// Loop through each cell and update values for cell_loaded and spawn entities for newly loaded cells.
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

		
		var n = 0;
		// If true, loop through all adjacent cells in a 3x3 square.
		if (check_cell == true && grid_cell[2] == false) {
			for (var i1 = -1-n; i1 < 2+n; i1 += 1) {
				// Continue for loop if grid_y + i1 is out of bounds.
				if (grid_y + i1 < 0 || grid_y + i1 > ds_grid_height(level_grid)-1) {continue;}				
				for (var i2 = -1-n; i2 < 2+n; i2 += 1) {
					// Continue for loop if grid_x + i2 is out of bounds.
					if (grid_x + i2 < 0 || grid_x + i2 > ds_grid_width(level_grid)-1) {continue;}
					
					// Copy the cell so all its data can be overwritten/expanded.
					var grid_cell = ds_grid_get(level_grid, grid_x+i2, grid_y+i1);
					
					// If cell_loaded is false, overwrite cell_loaded in grid cell andspawnspawnspawnadnasjdn212354564
					if (grid_cell[3] == false) {
						grid_cell[3] = true;
						ds_grid_set(level_grid, grid_x+i2, grid_y+i1, grid_cell);
						var entity_quantity = irandom_range(enemy_density[level_id+1][0], enemy_density[level_id+1][1]);
						for (var i = 0; i < entity_quantity; i += 1) {								
							var entity_type = random_weighted(
								enemy_pool[0 ][level_id+1], 
								enemy_pool[1 ][level_id+1], 
								enemy_pool[2 ][level_id+1], 
								enemy_pool[3 ][level_id+1], 
								enemy_pool[4 ][level_id+1],
								enemy_pool[5 ][level_id+1],
								enemy_pool[6 ][level_id+1],
								enemy_pool[7 ][level_id+1],
								enemy_pool[8 ][level_id+1],
								enemy_pool[9 ][level_id+1],
								enemy_pool[10][level_id+1]
							);
							
							var entity_id = enemy_pool[entity_type][0];
							var entity_dimensions = sprite_get_width(object_get_sprite(entity_id))/2;
							var entity_x = irandom_range(grid_cell[0][0]+entity_dimensions, grid_cell[0][2]-entity_dimensions);
							var entity_y = irandom_range(grid_cell[0][1]+entity_dimensions, grid_cell[0][3]-entity_dimensions);
							
							// Ensure the spawn position does not overlap with an existing object.
							while (collision_rectangle(
								entity_x+entity_dimensions, entity_y-entity_dimensions, 
								entity_x+entity_dimensions, entity_y-entity_dimensions, 
								obj_faction_enemy, false, true)) 
								{
								entity_x = irandom_range(grid_cell[0][0]+entity_dimensions, grid_cell[0][2]-entity_dimensions);
								entity_x = irandom_range(grid_cell[0][1]+entity_dimensions, grid_cell[0][3]-entity_dimensions);	
							}
							
							// Create entity
							instance_create_layer(entity_x, entity_y, "Instances", entity_id);
						}
					}
				}
			}
		}
	}
}


// Loop through each cell and update values for player_occupy and player_visit.
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
		
		// If true, overwrite player_occupy and player_visit in grid cell to true.
		if (check_cell == true) {
			grid_cell[1] = true;
			grid_cell[2] = true;
			ds_grid_set(level_grid, grid_x, grid_y, grid_cell);
		}
		
		// If no longer true, overwrite player_occupy in grid cell to false and player visit to true.
		else if (grid_cell[1] == true) {		
			grid_cell[1] = false;
			grid_cell[2] = true;
			ds_grid_set(level_grid, grid_x, grid_y, grid_cell);
		}
	}
}

