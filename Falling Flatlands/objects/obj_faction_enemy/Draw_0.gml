// Draw Health HUD ////////////////////////////////////////////////////////////
// Set variable position.
var offset_x = 48;
var offset_y = 46;

var bar_width = floor(96/health_points_max);
var bar_width = floor(64/health_points_max);

var bar_offset = (sprite_width - 64)/2

// Draw grey-dient background bars.
for (var i = 0; i < health_points_max; i += 1) {
	draw_sprite_ext(spr_enemy_hp_fill, 0, 
		x - offset_x + bar_width*i + 1 + bar_offset, 
		y + offset_y,
		bar_width - 2, 1, 0, c_white, 1);
}

// Draw red gradient foreground bars.
for (var i = 0; i < health_points; i += 1) {
	draw_sprite_ext(spr_enemy_hp_fill, 1, 
		x - offset_x + bar_width*i + 1 + bar_offset, 
		y + offset_y,
		bar_width - 2, 1, 0, c_white, 1);
}

// Draw black-red seperation overlay bars.
for (var i = 0; i < health_points_max+1; i += 1) {
	draw_sprite_ext(spr_enemy_hp_shape, 1, 
		x - offset_x + bar_width*i - 1 + bar_offset, 
		y + offset_y,
		1, 1, 0, c_white, 1);
}

// Draw black-grey seperation overlay bars.
for (var i = health_points_max-0; i > health_points-1; i -= 1) {
	draw_sprite_ext(spr_enemy_hp_shape, 2, 
		x - offset_x + bar_width*i - 1 + bar_offset, 
		y + offset_y,
		1, 1, 0, c_white, 1);
}

// Draw black closing bar left.
draw_sprite_ext(spr_enemy_hp_shape, 3, 
	x - offset_x + bar_width*0 - 1 + bar_offset, 
	y + offset_y,
	1, 1, 0, c_white, 1);
	
// Draw black closing bar right.
draw_sprite_ext(spr_enemy_hp_shape, 3, 
	x - offset_x + bar_width*(health_points_max) - 1 + bar_offset, 
	y + offset_y,
	1, 1, 0, c_white, 1);

