


// Draw Charge Effects ////////////////////////////////////////////////////////
// Set effect variables.
var n = 8;
var blur_length = (booster_charge_timer / booster_charge_timer_max);
var blur_colour = make_colour_rgb(	250-075*booster_charge_timer, 
									250-100*booster_charge_timer, 
									250-050*booster_charge_timer);

// Draw charge/boost effects. 
if (boost_mode || booster_charge_enable) {
	draw_sprite_ext(sprite_index, -1,
		x + lengthdir_x(n*blur_length, image_angle), y + lengthdir_y(n*blur_length, image_angle),
		1, 1, image_angle, blur_colour, image_alpha-0.4);
		
	draw_sprite_ext(sprite_index, -1,
		x - lengthdir_x(n*blur_length, image_angle), y - lengthdir_y(n*blur_length, image_angle),
		1, 1, image_angle, blur_colour, image_alpha-0.4);
}

// Draw charge/boost effects. 
if (booster_charge_enable && !booster_charge_complete) {	
	// Particle FX.
	with(obj_particles){		
		var charge_dir		= random(360);	// 360
		var charge_dist		= 64;			// 100
		var charge_x		= other.x + lengthdir_x(charge_dist, charge_dir);
		var charge_y		= other.y + lengthdir_y(charge_dist, charge_dir);
		var charge_part_dir	= point_direction(charge_x, charge_y, other.x, other.y);
		part_type_direction(	part_type_charge_artemis, charge_part_dir, charge_part_dir, 0, 0);
		part_type_orientation(	part_type_charge_artemis, charge_part_dir, charge_part_dir, 0, 0, 0);
		part_particles_create(	particle_system, charge_x, charge_y, part_type_charge_artemis, 1);	
	}
}

// Draw Ship Hull /////////////////////////////////////////////////////////////
draw_sprite_ext(sprite_index, -1, x, y, 1, 1, image_angle, blur_colour, image_alpha);


//// Draw Target Crosshair //////////////////////////////////////////////////////
//if (!grapple_mode && instance_exists(grapple_target)) {
//	draw_sprite_ext(crosshair_target_sprite_id, crosshair_target_sprite_frame, grapple_target.x, grapple_target.y, 1, 1, 0, c_orange, 1);
//}


//// Draw Grapple Line //////////////////////////////////////////////////////////
//if (grapple_mode && instance_exists(grapple_target)) {
//	draw_line_width(x, y, grapple_target.x, grapple_target.y, 1);
//}


//// Draw grapple line.
//if instance_exists(grapple_target) {
//	//draw_line_width(creator.x-1, creator.y-1, grapple_target.x-1, grapple_target.y-1, 1);
//	//draw_sprite_ext(spr_grapple_hook, -1, grapple_target.x, grapple_target.y,
//	//1, 1, grapple_target.image_angle, c_white, 1);
//	//draw_sprite_ext(spr_grapple_turret, -1, creator.x, creator.y,
//	//1, 1, creator.image_angle - 90 * creator_direction, c_white, 1);

//	var dist = point_distance(creator.x, creator.y, grapple_target.x, grapple_target.y)
//	for (var i = 0; i <= abs(dist/8); i++) {
//		draw_sprite_ext(spr_grapple_chain, -1,
//		grapple_target.x-lengthdir_x(dist-i*8, point_direction(creator.x, creator.y, grapple_target.x, grapple_target.y)),
//		grapple_target.y-lengthdir_y(dist-i*8, point_direction(creator.x, creator.y, grapple_target.x, grapple_target.y)),
//		1, 1, creator.image_angle - 90 * creator_direction, c_white, 1);
//	}
	
//	draw_sprite_ext(spr_grapple_hook, -1, grapple_target.x, grapple_target.y,
//	1, 1, grapple_target.image_angle, c_white, 1);
//	draw_sprite_ext(spr_grapple_turret, -1, creator.x, creator.y,
//	1, 1, creator.image_angle - 90 * creator_direction, c_white, 1);	
//}

