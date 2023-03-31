/// @description Draw Debug Grid
for (var grid_y = 0; grid_y < level_grid_size; grid_y += 1) {
	for (var grid_x = 0; grid_x < level_grid_size; grid_x += 1) {
		draw_rectangle_color(
			ds_grid_get(level_grid, grid_x, grid_y)[0][0],
			ds_grid_get(level_grid, grid_x, grid_y)[0][1],
			ds_grid_get(level_grid, grid_x, grid_y)[0][2],
			ds_grid_get(level_grid, grid_x, grid_y)[0][3],
			c_red, c_red, c_red, c_red, true);
	}
}


draw_line_width(0, 0, room_width, 0, 4);
draw_line_width(0, 0, 0, room_height, 4);
draw_line_width(0, room_height, room_width, room_height, 4);
draw_line_width(room_width, 0, room_width, room_height, 4);


//// Destroy projectile if it goes beyond the camera boundaries.
//var border_x1 = uc_get_view_x() - Camera.camera_width  / 10;
//var border_y1 = uc_get_view_y() - Camera.camera_height / 10;
//var border_x2 = uc_get_view_x() + Camera.camera_width  / 10 + Camera.camera_width;
//var border_y2 = uc_get_view_y() + Camera.camera_height / 10 + Camera.camera_height;
//draw_rectangle(
//	border_x1,
//	border_y1,
//	border_x2,
//	border_y2,
//	true)
