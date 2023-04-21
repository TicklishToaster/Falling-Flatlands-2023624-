// If current object is not onscreen then exit this event and nullify the potentially expensive processes below.
if (!point_in_rectangle(x, y, Camera.border_x1, Camera.border_y1, Camera.border_x2, Camera.border_y2)) {
	exit;
}


// Draw sprite.
draw_sprite_ext(
	sprite_index, projectile_sprite_frame, x, y, 1, 1,
	projectile_direction, projectile_sprite_colour, 1);

