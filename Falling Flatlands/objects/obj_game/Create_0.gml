score = 0;
lives = 3;

// Time Modifier for slow-mo effects. Develop Later.
global.time_modifier = 1;

draw_set_font(fnt_text);
audio_master_gain(0.5);

randomize();

enum factions {
	player,
	ally,
	neutral,
	enemy
}



//level_grid	= ds_grid_create(10, 10);
//level_grid_size	= 10;
//level_cell_size	= obj_camera.camera_width;

//room_height = level_grid_size * level_cell_size;
//room_width	= level_grid_size * level_cell_size;

