// Inherit the parent event
event_inherited();


// Draw Booster HUD ///////////////////////////////////////////////////////////
// Set variable position and interior bar width.
var ypos = 20 + 30;
var bar_width = 30;

// Draw greyed out bars first.
for (var i = 0; i < 5; i += 1) {
    draw_sprite_ext(spr_boost, 3, 20 + 32*i, ypos, 1, 1, 0, c_white, 1);
}

// Draw charge bar backdrop.
draw_sprite_general(spr_boost_fill, 0, 0, 0, sprite_width, sprite_height,
	(20 + 17 - 2), (6 + 2 + ypos), 
	160, 1, 0, 
	c_white, c_white, c_white, c_white, 0.4);

// Draw pink extending charge bar.
draw_sprite_general(spr_boost_fill, 0, 0, 0, sprite_width, sprite_height,
	(20 + 17 - 2), (6 + 2 + ypos), 
	(booster_charge_timer / booster_charge_timer_max) * 160, 1, 0, 
	c_white, c_white, c_white, c_white, 1);
	
// Draw bar markings.
for (var i = 0; i < 4; i += 1) {
    draw_sprite_ext(spr_boost, 4, 20 + 40*i, ypos, 1, 1, 0, c_white, 1);
}
	
// Draw pink charge icon.
draw_sprite_ext(spr_boost, 0, 20, ypos, 1, 1, 0, c_white, 1);