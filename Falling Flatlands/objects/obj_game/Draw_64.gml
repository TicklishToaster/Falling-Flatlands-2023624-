switch(room){
	case rm_game:
		//draw_sprite_ext(spr_ship, 0, obj_camera.camera_width-20, 40-10, 0.5, 0.5, 0, c_white, 1);
		draw_text(obj_camera.camera_width-50, 10-2, string(lives));
		draw_text(obj_camera.camera_height-200, 10-2, string(score)+" ");
		break;
		
	case rm_start:
		draw_set_halign(fa_center);
		var c = c_yellow;		
		draw_text_transformed_color(room_width/2, 100, "SPACE ROCKS", 2, 2, 0, c, c, c, c, 1);
		draw_text(
			room_width/2, 200, 
			"Score 1,000 points!\n"+
			"\n"+
			"W/S: Move Forward/Backward\n"+
			"A/D: Turn Left/Right\n"+
			"SPACE: Shoot\n"+
			"SHIFT: SHIELD\n"+
			"MOUSE 1: GRAPPLE\n"+
			"\n"+
			">> PRESS ENTER TO START <<\n"+
			">> PRESS ESCAPE TO QUIT <<"
		);
		draw_set_halign(fa_left);
		break;
		
	case rm_win:
		draw_set_halign(fa_center);
		var c = c_lime;
		draw_text_transformed_color(room_width/2, 200, "WIN", 3, 3, 0, c, c, c, c, 1);
		draw_text(room_width/2, 300, "PRESS ENTER TO RESTART");
		draw_set_halign(fa_left);	
		break;
		
	case rm_gameover:
		draw_set_halign(fa_center);
		var c = c_red;
		draw_text_transformed_color(room_width/2, 150, "GAME OVER", 3, 3, 0, c, c, c, c, 1);
		draw_text(room_width/2, 250, "FINAL SCORE: " + string(score));
		draw_text(room_width/2, 300, "PRESS ENTER TO RESTART");		
		draw_set_halign(fa_left);	
		break;		
}
