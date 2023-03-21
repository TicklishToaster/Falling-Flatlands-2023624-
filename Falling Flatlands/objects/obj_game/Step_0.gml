if keyboard_check_pressed(vk_enter){
	switch(room){
		case rm_start:
			room_goto(rm_game);
			break;
			
		case rm_win:
		case rm_gameover:
			game_restart();
			break;
	}
}

if room == rm_game{
	// CHANGE BACK TO 1000 LATER
	if score >= 100000 {
		room_goto(rm_win);
	}

	if lives <= 0 {
		room_goto(rm_gameover);
	}
}


//if (keyboard_check_pressed(ord("1"))) {
//	instance_create_layer(x, y, "Instances", obj_ship_squire);
//	//obj_camera.target = obj_ship_squire;
//}
//if (keyboard_check_pressed(ord("2"))) {
//	instance_create_layer(x, y, "Instances", obj_ship_goliath);
//	//obj_camera.target = obj_ship_goliath;
//}


if (keyboard_check_pressed(vk_escape)) {
	game_end();
}