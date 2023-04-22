

randomize();
audio_master_gain(0.5);
//instance_layer_activation = true;

selected_ship_id	= noone;
selected_level_id	= -1;
target_level_condition_data	= [];
target_level_enemy_pool		= [];
target_level_enemy_density	= [];

instance_create_layer(x, y, "Instances", Camera);
instance_create_layer(x, y, "Menu", obj_menu);