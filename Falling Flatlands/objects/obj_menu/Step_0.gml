// Open Game Menu if escape is pressed.
if (keyboard_check_pressed(vk_escape) && room != rm_start) {
	menu_active = !menu_active;
	
	var target_layer = layer_get_id("Instances");
	var player_id = obj_faction_player.id;

	// Pause all activity in the instances layer if the game menu is open.
	if (menu_active && instance_layer_activation) {
		instance_layer_activation = false;
		instance_deactivate_object(obj_faction);
		instance_deactivate_object(obj_projectile);
		instance_deactivate_object(obj_swarmer_drone);
		dopple_id = instance_create_layer(player_id.x, player_id.y, "Instances", obj_faction_player_dopple);
		camera_last_x = Camera.x;
		camera_last_y = Camera.y;
		Camera.x = Camera.target_x;
		Camera.y = Camera.target_y;
		
		audio_play_sound(UI__ITB____Menu_Open, 10, false, 0.5);
	}

	// Pause all activity in the instances layer if the game menu is open.
	else if (!menu_active && !instance_layer_activation) {
		instance_layer_activation = true;
		instance_activate_object(obj_faction);
		instance_activate_object(obj_projectile);
		instance_activate_object(obj_swarmer_drone);
		instance_destroy(dopple_id)
		Camera.x = camera_last_x;
		Camera.y = camera_last_y;
		
		audio_play_sound(UI__ITB____Menu_Close, 10, false, 0.5);
	}
}