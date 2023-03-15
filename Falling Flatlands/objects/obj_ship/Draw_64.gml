//var ypos = 20;

//// Draw HP
//draw_sprite(spr_ship_health_bar, 3-ship_hp, 20, ypos + 0);
//draw_sprite_ext(spr_ship_health_bar, 4, 20, ypos, 1, 1, 0, c_white, 0.4 + 0.2*ship_hp);

//// Draw Shield
//draw_sprite(spr_ship_shield_bar, 0, 20, ypos + 30);
//draw_sprite_ext(spr_hud_bar, 0, 20+	16, ypos+30+8, clamp(ship_shield_power, 0, 10)*10, 1, 0, image_blend, 1);
//draw_sprite_ext(spr_ship_shield_bar, 1, 20, ypos + 30, 1, 1, 0, c_white, 1);
//draw_sprite_ext(spr_ship_shield_bar, 2, 20, ypos + 30, 1, 1, 0, c_white, ship_shield_power/10);

//// Draw Powerups
//var powerups = [ship_powerups.spread_shot, ship_powerups.scatter_shot, ship_powerups.rapid_shot, ship_powerups.laser_shot];
//var num = 0;
//for (var i = 0; i <= 3 ; i++){
//	if powerups[i] {
//		num += 1;
//	}
//	draw_sprite(spr_ship_powerup_bar, 0 + num, 20, ypos + 60);	
//}
//var num = -1;
//if ship_powerups.spread_shot {
//	num += 1;
//	draw_sprite(spr_ship_powerup_bar, 5, 20 + 24*num, ypos + 60);
//} 
//if ship_powerups.scatter_shot {
//	num += 1;
//	draw_sprite(spr_ship_powerup_bar, 6, 20 + 24*num, ypos + 60);
//} 
//if ship_powerups.rapid_shot {
//	num += 1;
//	draw_sprite(spr_ship_powerup_bar, 7, 20 + 24*num, ypos + 60);
//} 
//if ship_powerups.laser_shot {
//	num += 1;
//	draw_sprite(spr_ship_powerup_bar, 8, 20 + 24*num, ypos + 60);
//}

//// Draw Powerup Timer
//draw_sprite(spr_ship_powerup_timer, 0, 20, ypos + 84);
//draw_sprite_ext(spr_hud_bar, 1, 20+16, ypos+84+8, powerup_timer*12.5, 1, 0, image_blend, 1);
//draw_sprite_ext(spr_ship_powerup_timer, 1, 20, ypos + 84, 1, 1, 0, c_white, 1);
