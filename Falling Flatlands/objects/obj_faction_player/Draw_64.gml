// Draw Health HUD ////////////////////////////////////////////////////////////
// Set variable position.
var ypos = 20;

// Draw greyed out bars first.
for (var i = 0; i < health_points_max; i += 1) {
    draw_sprite_ext(spr_hp_bar, 1, 20 + 32*i, ypos, 1, 1, 0, c_white, 1);
}

// Draw red filled bars to overlap greyed out bars.
for (var i = 0; i < health_points; i += 1) {
    draw_sprite_ext(spr_hp_bar, 0, 20 + 32*i, ypos, 1, 1, 0, c_white, 1);
}

// Draw ending bar cover line.
draw_sprite_ext(spr_hp_bar, 2, 20 + 32*(health_points_max-1), ypos, 1, 1, 0, c_white, 1);

// Draw greyed out health icon first.
draw_sprite_ext(spr_hp_icon, 1, 20, ypos, 1, 1, 0, c_white, 1);

// Draw red filled health icon to overlap greyed out icon.
draw_sprite_ext(spr_hp_icon, 0, 20, ypos, 1, 1, 0, c_white, 0.4 + 0.1 * health_points);
