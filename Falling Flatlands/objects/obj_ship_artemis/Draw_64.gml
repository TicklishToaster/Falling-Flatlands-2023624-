// Inherit the parent event
event_inherited();



// Draw Booster HUD ///////////////////////////////////////////////////////////
// Set variable position and interior bar width.
var ypos = 20 + 30;
var bar_width = 30;

// Draw greyed out bars first.
for (var i = 0; i < 5; i += 1) {
    draw_sprite_ext(spr_HUD_boost, 3, 20 + 32*i, ypos, 1, 1, 0, c_white, 1);
}
//// Draw blue filled bars to overlap greyed out bars.
//for (var i = 0; i < shield_points; i += 1) {
//	draw_sprite_ext(spr_sp_bar, 0, 20 + 32*i, ypos, 1, 1, 0, c_white, 0.4 + 0.2 * shield_points);
//}
//// Draw ending bar cover line.
//draw_sprite_ext(spr_sp_bar, 2, 20 + 32*(5-1), ypos, 1, 1, 0, c_white, 1);


//// Draw pink extending charge bar.
//if (!boost_mode && booster_charge_enable) {
//	draw_sprite_general(spr_HUD_boost_fill, 0, 0, 0, sprite_width, sprite_height,
//		(20 + 17 - 2), (6 + 2 + ypos), 
//		//(booster_charge_timer_max - booster_charge_timer) * 160/2, 1, 0, 
//		//(booster_charge_timer_max - booster_charge_timer) * 160/2, 1, 0, 
//		//(1 - (booster_charge_timer / booster_charge_timer_max)) * 160, 1, 0, 
//		(booster_charge_timer / booster_charge_timer_max) * 160, 1, 0, 
//		c_white, c_white, c_white, c_white, 0.4 + 0.2 * shield_points);
//}

//// Draw pink extending charge bar.
//if (boost_mode && !booster_charge_enable) {
//	draw_sprite_general(spr_HUD_boost_fill, 0, 0, 0, sprite_width, sprite_height,
//		(20 + 17 - 2), (6 + 2 + ypos), 
//		//(speed - max_speed_default) * 160/4, 1, 0, 
//		//(booster_charge_timer_max - (booster_charge_timer / booster_charge_timer_max)) * 160, 1, 0,
//		(booster_charge_timer / booster_charge_timer_max) * 160, 1, 0, 
//		c_white, c_white, c_white, c_white, 0.4 + 0.2 * shield_points);
//}


draw_sprite_general(spr_HUD_boost_fill, 0, 0, 0, sprite_width, sprite_height,
	(20 + 17 - 2), (6 + 2 + ypos), 
	160, 1, 0, 
	c_white, c_white, c_white, c_white, 0.4);


draw_sprite_general(spr_HUD_boost_fill, 0, 0, 0, sprite_width, sprite_height,
	(20 + 17 - 2), (6 + 2 + ypos), 
	//(booster_charge_timer / booster_charge_timer_max) * 160, 1, 0, 
	(booster_charge_timer / booster_charge_timer_max) * 160, 1, 0, 
	c_white, c_white, c_white, c_white, 1);
	

// Draw greyed out bars first.
for (var i = 0; i < 4; i += 1) {
    draw_sprite_ext(spr_HUD_boost, 4, 20 + 40*i, ypos, 1, 1, 0, c_white, 1);
    //draw_sprite_ext(spr_HUD_boost, 5, 20 + 40*i, ypos, 1, 1, 0, c_white, 0.4);
}
	
	
//// Draw cyan retracting duration bar.
//draw_sprite_general(spr_HUD_boost, 1, 0, 0, sprite_width, sprite_height,
//	(20 + 17 + 32*(shield_points)), (6 + 2 + ypos),
//	bar_width*(shield_enabled_timer/shield_enabled_timer_max), 1, 0, 
//	c_white, c_white, c_white, c_white, 0.4 + 0.2 * shield_points);


//// Draw greyed out shield icon first.
//draw_sprite_ext(spr_HUD_boost, 1, 20, ypos, 1, 1, 0, c_white, 1);

// Draw blue filled shield icon to overlap greyed out icon.
draw_sprite_ext(spr_HUD_boost, 0, 20, ypos, 1, 1, 0, c_white, 1);