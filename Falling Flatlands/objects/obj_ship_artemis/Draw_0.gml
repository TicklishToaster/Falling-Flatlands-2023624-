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


// Draw Propusion Effects /////////////////////////////////////////////////////
// Particle FX.
//if (!boost_mode && input_up_hold) {
if (!boost_mode && (input_up_hold || input_left_hold || input_right_hold)) {
	exhaust_counter++;
	if(exhaust_counter >= 4){
		exhaust_counter = 0;
		var xx = x - lengthdir_x(sprite_height*0.2, image_angle);
		var yy = y - lengthdir_y(sprite_height*0.2, image_angle);
		with(obj_particles){
			part_particles_create(particle_system, xx, yy, part_type_ship_exhaust_large, 1);
		}
	}
}

// Particle FX.
if (boost_mode) {
	exhaust_counter++;
	if (exhaust_counter >= 2){
		exhaust_counter = 0;
		var xx = x - lengthdir_x(sprite_height*0.2, image_angle);
		var yy = y - lengthdir_y(sprite_height*0.2, image_angle);
		with(obj_particles){
			part_particles_create(particle_system, xx, yy, part_type_ship_exhaust_large, 1);
		}
	}
}


// Draw Ship Hull /////////////////////////////////////////////////////////////
draw_sprite_ext(sprite_index, -1, x, y, 1, 1, image_angle, blur_colour, image_alpha);
