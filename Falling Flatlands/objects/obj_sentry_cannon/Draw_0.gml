// Inherit the parent event
event_inherited();

// Draw sentry hull and gun sprites.
draw_sprite_ext(spr_enemy_sentry_hull, (sprite_get_number(sprite_index)) - health_points, x, y, 1, 1, 0, enemy_colour_blend, 1);
draw_sprite_ext(spr_enemy_sentry_gun, 0, x, y, 1, 1, gun_angle, enemy_colour_blend, 1);
