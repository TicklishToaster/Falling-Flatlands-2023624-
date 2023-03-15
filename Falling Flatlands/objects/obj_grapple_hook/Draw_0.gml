// Draw grapple line.
if instance_exists(grapple_target) {
	//draw_line_width(creator.x-1, creator.y-1, grapple_target.x-1, grapple_target.y-1, 1);
	//draw_sprite_ext(spr_grapple_hook, -1, grapple_target.x, grapple_target.y,
	//1, 1, grapple_target.image_angle, c_white, 1);
	//draw_sprite_ext(spr_grapple_turret, -1, creator.x, creator.y,
	//1, 1, creator.image_angle - 90 * creator_direction, c_white, 1);

	var dist = point_distance(creator.x, creator.y, grapple_target.x, grapple_target.y)
	for (var i = 0; i <= abs(dist/8); i++) {
		draw_sprite_ext(spr_grapple_chain, -1,
		grapple_target.x-lengthdir_x(dist-i*8, point_direction(creator.x, creator.y, grapple_target.x, grapple_target.y)),
		grapple_target.y-lengthdir_y(dist-i*8, point_direction(creator.x, creator.y, grapple_target.x, grapple_target.y)),
		1, 1, creator.image_angle - 90 * creator_direction, c_white, 1);
	}
	
	draw_sprite_ext(spr_grapple_hook, -1, grapple_target.x, grapple_target.y,
	1, 1, grapple_target.image_angle, c_white, 1);
	draw_sprite_ext(spr_grapple_turret, -1, creator.x, creator.y,
	1, 1, creator.image_angle - 90 * creator_direction, c_white, 1);	
}

