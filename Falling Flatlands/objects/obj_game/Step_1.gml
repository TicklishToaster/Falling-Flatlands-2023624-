/// @description Insert description here
// You can write your code in this editor



//show_debug_message("");
//show_debug_message("LEVEL GRID:");



//for (var grid_y = 0; grid_y < level_grid_size; grid_y += 1) {
//	//var temp_array = [];
//	var temp_string		= " ";
//	var temp_separator	= " - ";
	
//	for (var grid_x = 0; grid_x < level_grid_size; grid_x += 1) {	
//		for (var i = 0; i < array_length(ds_grid_get(level_grid, grid_x, grid_y)); i += 1) {
//			if (i != -1) {
//				var cell_data = ds_grid_get(level_grid, grid_x, grid_y)[i];
//				temp_string = string_insert(string(cell_data) + ", ", temp_string, string_length(temp_string));
//			}
//		}
		
//		//temp_string = string_insert(temp_separator, temp_string, string_length(temp_string));
		
//		var temp_length = max(10 - string_length(string(cell_data)), 0);
//		var add_length	= " ";
//		for (var i = 0; i < temp_length; i += 1) {add_length = string_insert("|", add_length, 1);}
//		temp_string = string_insert(add_length, temp_string, string_length(temp_string));
		
//		temp_string = string_insert(temp_separator, temp_string, string_length(temp_string));		
//	}

//	show_debug_message(temp_string);
	

//}