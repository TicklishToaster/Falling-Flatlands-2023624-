// Inherit the parent event
event_inherited();


// Draw Shield HUD ////////////////////////////////////////////////////////////
// Set variable position and interior bar width.
var ypos = 20 + 30;
var bar_width = 30;

// Draw greyed out bars first.
for (var i = 0; i < shield_points_max; i += 1) {
    draw_sprite_ext(spr_sp_bar, 1, 20 + 32*i, ypos, 1, 1, 0, c_white, 1);
}
// Draw blue filled bars to overlap greyed out bars.
for (var i = 0; i < shield_points; i += 1) {
	draw_sprite_ext(spr_sp_bar, 0, 20 + 32*i, ypos, 1, 1, 0, c_white, 0.4 + 0.2 * shield_points);
}
// Draw ending bar cover line.
draw_sprite_ext(spr_sp_bar, 2, 20 + 32*(shield_points_max-1), ypos, 1, 1, 0, c_white, 1);

// Draw blue extending recharge bar.
if (shield_recharge) {
	draw_sprite_general(spr_sp_bar_fill, 0, 0, 0, sprite_width, sprite_height,
		(20 + 17 + 32*(shield_points)), (6 + 2 + ypos), 
		bar_width*(shield_recharge_timer_max - shield_recharge_timer)/shield_recharge_timer_max, 1, 0, 
		c_white, c_white, c_white, c_white, 0.4 + 0.2 * shield_points);
}
// Draw cyan retracting duration bar.
if (shield_enabled) {
	draw_sprite_general(spr_sp_bar_fill, 1, 0, 0, sprite_width, sprite_height,
		(20 + 17 + 32*(shield_points)), (6 + 2 + ypos),
		bar_width*(shield_enabled_timer/shield_enabled_timer_max), 1, 0, 
		c_white, c_white, c_white, c_white, 0.4 + 0.2 * shield_points);
}

// Draw greyed out shield icon first.
draw_sprite_ext(spr_sp_icon, 1, 20, ypos, 1, 1, 0, c_white, 1);

// Draw blue filled shield icon to overlap greyed out icon.
draw_sprite_ext(spr_sp_icon, 0, 20, ypos, 1, 1, 0, c_white, 0.4 + 0.2 * shield_points);