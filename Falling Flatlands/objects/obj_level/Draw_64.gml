/// @description Draw Minimap
// Draw minimap border.
draw_circle_colour(+2/Camera.view_scale + surface_width/2, Camera.camera_height -2/Camera.view_scale - surface_width/2, 
	surface_width/2 + 2, c_white, c_white, false);

// Draw minimap backdrop.
draw_circle_colour(+2/Camera.view_scale + surface_width/2, Camera.camera_height -2/Camera.view_scale - surface_width/2, 
	surface_width/2, c_black, c_black, false);

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

#region
// Draw player icon (blue circle)
draw_sprite_ext(spr_minimap_icon, 2,
	(surface_width/2)*4,
	(surface_width/2)*4,
	2, 2, 0, -1, 1);
	
// Draw enemy icons (red circle)
for (var i = 0; i < instance_number(obj_faction_enemy); i += 1) {
	var target_iteration= instance_find(obj_faction_enemy, i);
	var target_distance	= point_distance(minimap_target.x, minimap_target.y, target_iteration.x, target_iteration.y);
	var target_direction= point_direction(minimap_target.x, minimap_target.y, target_iteration.x, target_iteration.y);
	draw_sprite_ext(spr_minimap_icon, 0,
		(surface_width/2 + lengthdir_x(target_distance, target_direction)/(proportion/2))*4,
		(surface_width/2 + lengthdir_y(target_distance, target_direction)/(proportion/2))*4,
		2, 2, 0, -1, 1);
}

// Draw powerup icons (green circle)
for (var i = 0; i < instance_number(obj_powerup); i += 1) {
	// Determine target variables.
	var target_iteration= instance_find(obj_powerup, i);
	var target_distance	= point_distance(minimap_target.x, minimap_target.y, target_iteration.x, target_iteration.y);
	var target_direction= point_direction(minimap_target.x, minimap_target.y, target_iteration.x, target_iteration.y);
	draw_sprite_ext(spr_minimap_icon, 1,
		(surface_width/2 + lengthdir_x(target_distance, target_direction)/(proportion/2))*4,
		(surface_width/2 + lengthdir_y(target_distance, target_direction)/(proportion/2))*4,
		2, 2, 0, -1, 1);
}
#endregion

#region
// Draw exit portal objective arrow.
if (condition_win_portal) {
	if (condition_portal_hidden == false) {
		// Determine target variables.
		var target_dir = point_direction(obj_faction_player.x, obj_faction_player.y, obj_exit_portal.x, obj_exit_portal.y);
		var target_dist = point_distance(obj_faction_player.x, obj_faction_player.y, obj_exit_portal.x, obj_exit_portal.y)/16;
		var target_alpha = clamp(target_dist/320, 0, 1);

		draw_sprite_ext(spr_minimap_arrow_x16, -1,
			(surface_width/2)*4 + lengthdir_x(clamp(target_dist, 0, (surface_width/2)*4 - 8*4), target_dir),
			(surface_width/2)*4 + lengthdir_y(clamp(target_dist, 0, (surface_width/2)*4 - 8*4), target_dir),
			4, 4, target_dir, c_blue, target_alpha);
	}
}

// Draw key objective arrow(s).
if (condition_win_key) {
	for (var i = 0; i < array_length(condition_key_list); ++i) {
		if (instance_exists(condition_key_list[i])) {
			// Determine target variables.
			var target_dir = point_direction(obj_faction_player.x, obj_faction_player.y, condition_key_list[i].x, condition_key_list[i].y);
			var target_dist = point_distance(obj_faction_player.x, obj_faction_player.y, condition_key_list[i].x, condition_key_list[i].y)/16;
			var target_alpha = clamp(target_dist/320, 0, 1);

			draw_sprite_ext(spr_minimap_arrow_x16, -1,
				(surface_width/2)*4 + lengthdir_x(clamp(target_dist, 0, (surface_width/2)*4 - 8*4), target_dir),
				(surface_width/2)*4 + lengthdir_y(clamp(target_dist, 0, (surface_width/2)*4 - 8*4), target_dir),
				4, 4, target_dir, c_yellow, target_alpha);
		}
	}
}
#endregion


// Disable some GPU stuff I don't understand.
gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);

// Draw the rectangular border with 0 alpha blending (invisible borders).
draw_set_alpha(0);
draw_rectangle(0, 0, surface_width*4, surface_width*4, false);
draw_set_alpha(1);

// Draw the circular window to overlap and hide everything outside of its radius.
draw_circle((surface_width/2)*4 + 3, (surface_width/2)*4 + 3, (surface_width/2 - 1)*4, false);

// Re-enable the GPU stuff I don't understand.
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);

// Reset the target surface, to the game can go back to drawing everything else normally.
surface_reset_target();

// Draw Surface (Popup Window)
if (view_visible[1]) {
	//draw_surface_ext(minimap_surface, 2, -4*4 + minimap_offset, 0.25, 0.25, 0, -1, 1);
	draw_surface_ext(minimap_surface, 2/Camera.view_scale, (Camera.camera_height-surface_width) - 2/Camera.view_scale, 0.25, 0.25, 0, -1, 1);
}


#region
var y_offset = 0;
var objective_transparency = 0.6;

// Draw Portal Objective
if (condition_win_portal) {	
	// Draw portal indicator sprite.
	var indicator_subimg = 1;
	if (condition_portal_hidden == true) {
	    indicator_subimg = 0;
	}
	draw_sprite_ext(spr_exit_portal_indicator, indicator_subimg, Camera.camera_width - 64 + 0, y_offset + 32, 1, 1, 0, -1, objective_transparency);
	
	// Draw portal sprite.
	draw_sprite_ext(spr_exit_portal, 0, Camera.camera_width - 32 + 8, y_offset + 32, 1, 1, 0, -1, objective_transparency);
	
	y_offset += 64;
}

// Draw Key Objective
if (condition_win_key) {	
	// Draw key sprite.
	draw_sprite_ext(spr_key, -1, Camera.camera_width - 32 + 8, y_offset + 28, 2, 2, 0, -1, objective_transparency);
	
	// Draw key numbers
	draw_set_font(fnt_alarm);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_top);
	var text_offset_y = 0;
	var text_w = 64;
	var text_h = 32;
	
	var text_offset_x = Camera.camera_width - 64 - 64 + 16 + 8;
	draw_text_ext_transformed_colour(text_offset_x + 00, y_offset + text_offset_y, string(condition_key_number), text_h, text_w, 
		1, 1, 0, c_white, c_white, c_white, c_white, objective_transparency);	
		
	var text_offset_x = Camera.camera_width - 64 - 32 + 8 + 8;
	draw_text_ext_transformed_colour(text_offset_x + 00, y_offset + text_offset_y, "/", text_h, text_w, 
		1, 1, 0, c_white, c_white, c_white, c_white, objective_transparency);
		
	var text_offset_x = Camera.camera_width - 64 + 8;
	//if (string_char_at(string(key_number_max), 0) == "1") {text_offset_x -= 8;}	
	draw_text_ext_transformed_colour(text_offset_x, y_offset + text_offset_y, string(condition_key_number_max), text_h, text_w, 
		1, 1, 0, c_white, c_white, c_white, c_white, objective_transparency);
	
	y_offset += 64;
}

// Draw Enemy Number Objective
if (condition_win_enemy) {	
	// Draw enemy sprite.
	draw_sprite_ext(spr_enemy_hunter, 0, Camera.camera_width - 32 + 8, y_offset + 28, 1, 1, 0, -1, objective_transparency);
	
	// Draw enemy numbers
	draw_set_font(fnt_alarm);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_top);
	var text_offset_y = 0;
	var text_w = 64;
	var text_h = 32;
	
	var text_offset_x = Camera.camera_width - 64 - 64 + 16 - 8;
	draw_text_ext_transformed_colour(text_offset_x + 00, y_offset + text_offset_y, string(condition_enemy_number), text_h, text_w, 
		1, 1, 0, c_white, c_white, c_white, c_white, objective_transparency);	
		
	var text_offset_x = Camera.camera_width - 64 - 32 + 8 - 6;
	draw_text_ext_transformed_colour(text_offset_x + 00, y_offset + text_offset_y, "/", text_h, text_w, 
		1, 1, 0, c_white, c_white, c_white, c_white, objective_transparency);
		
	var text_offset_x = Camera.camera_width - 64 - 4;
	draw_text_ext_transformed_colour(text_offset_x, y_offset + text_offset_y, string(condition_enemy_number_max), text_h, text_w, 
		1, 1, 0, c_white, c_white, c_white, c_white, objective_transparency);
	
	y_offset += 64;
}
#endregion