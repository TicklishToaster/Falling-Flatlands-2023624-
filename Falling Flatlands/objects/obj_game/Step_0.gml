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

		
		var n = 0; // DELETE LATER

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
						
						
						
						//var entity_quantity = irandom_range(2, 3);
						var entity_quantity = 0
						for (var i = 0; i < entity_quantity; i += 1) {
							var entity_x = irandom_range(grid_cell[0][0]+32, grid_cell[0][2]-32);
							var entity_y = irandom_range(grid_cell[0][1]+32, grid_cell[0][3]-32);
							var entity_type = choose(obj_sentry, obj_hunter_mk1, obj_hunter_mk2, obj_hunter_mk3);
							//var entity_type = choose(obj_sentry, obj_charger_mk1);
							
							// Create entity
							instance_create_layer(entity_x, entity_y, "Instances", entity_type);
						}
						//ds_grid_set(level_grid, grid_x+i2, grid_y+i1, grid_cell);
						
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

//// Loop through each cell and update values for cell_loaded and spawn entities for newly loaded cells.
//for (var grid_y = 0; grid_y < level_grid_size; grid_y += 1) {
//	for (var grid_x = 0; grid_x < level_grid_size; grid_x += 1) {

//		// Copy the cell so all its data can be overwritten/expanded.
//		var grid_cell = ds_grid_get(level_grid, grid_x, grid_y);
		
//		// Determine if player is within the confines of this grid cell.
//		var check_cell = point_in_rectangle(
//			obj_faction_player.x, obj_faction_player.y,
//			ds_grid_get(level_grid, grid_x, grid_y)[0][0], 
//			ds_grid_get(level_grid, grid_x, grid_y)[0][1],
//			ds_grid_get(level_grid, grid_x, grid_y)[0][2],
//			ds_grid_get(level_grid, grid_x, grid_y)[0][3]);

//		// If true, loop through all adjacent cells in a 3x3 square.
//		if (check_cell == true && grid_cell[2] == false) {
//			for (var i1 = -1; i1 < 2; i1 += 1) {
				
//				if (ds_grid_height(level_grid) < grid_y + i1 || ds_grid_height(level_grid) > grid_y + i1 ) {
//					show_debug_message("EXIT Y")
//					continue;
//				}
//				for (var i2 = -1; i2 < 2; i2 += 1) {
//					if (ds_grid_height(level_grid) < grid_x + i2 || ds_grid_height(level_grid) > grid_x + i2 ) {
//						show_debug_message("EXIT X")
//						continue;
//					}					
					
//					// Copy the cell so all its data can be overwritten/expanded.
//					var grid_cell = ds_grid_get(level_grid, grid_x+i2, grid_y+i1);
//					show_debug_message(ds_grid_get(level_grid, grid_x+i2, grid_y+i1))
					
//					// If cell_loaded is false, overwrite cell_loaded in grid cell andspawnspawnspawnadnasjdn212354564
//					if (grid_cell[2] == false) {
//						grid_cell[2] = true;
						
						
						
//						ds_grid_set(level_grid, grid_x+i2, grid_y+i1, grid_cell);
//					}
//				}
//			}
//		}
//	}
//}






















//if keyboard_check_pressed(vk_enter){
//	switch(room){
//		case rm_start:
//			room_goto(rm_game);
//			break;
			
//		case rm_win:
//		case rm_gameover:
//			game_restart();
//			break;
//	}
//}

//if room == rm_game{
//	// CHANGE BACK TO 1000 LATER
//	if score >= 100000 {
//		room_goto(rm_win);
//	}

//	if lives <= 0 {
//		room_goto(rm_gameover);
//	}
//}


////if (keyboard_check_pressed(ord("1"))) {
////	instance_create_layer(x, y, "Instances", obj_ship_squire);
////	//obj_camera.target = obj_ship_squire;
////}
////if (keyboard_check_pressed(ord("2"))) {
////	instance_create_layer(x, y, "Instances", obj_ship_goliath);
////	//obj_camera.target = obj_ship_goliath;
////}


if (keyboard_check_pressed(vk_escape)) {
	game_end();
}