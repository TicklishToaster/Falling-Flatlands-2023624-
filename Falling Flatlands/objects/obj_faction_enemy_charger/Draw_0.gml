// Inherit the parent event
event_inherited();


// Draw charge/boost effects. 
if (charge_enable || boosting) {	
	// Particle FX.
	with(obj_particles){
		var charge_dir		= random(360);	// 360
		var charge_dist		= random_range(16, 32);
		var charge_dist		= random_range(32, 48);
		var charge_x		= other.x + lengthdir_x(charge_dist, charge_dir);
		var charge_y		= other.y + lengthdir_y(charge_dist, charge_dir);
		var charge_part_dir	= point_direction(charge_x, charge_y, other.x, other.y);
		//part_type_direction(	part_type_charge_charger, charge_part_dir, charge_part_dir, 0, 0);
		//part_type_orientation(	part_type_charge_charger, charge_part_dir, charge_part_dir, 0, 0, 0);
		var charge_modifier = other.charge_timer_max-other.charge_timer;
		
		part_type_shape(	part_type_charge_charger, pt_shape_line);
		part_type_life(		part_type_charge_charger, 10, 60);
		part_type_size(		part_type_charge_charger, 0.1, 0.3, -0.01, 0);
		part_type_scale(	part_type_charge_charger, 1+charge_modifier, 1);
		part_type_colour1(	part_type_charge_charger, c_red);
		
		
		part_type_speed(		part_type_charge_charger, charge_modifier, charge_modifier, 0.01, 0);
		part_type_direction(	part_type_charge_charger, other.image_angle, other.image_angle, 0, 0);
		part_type_orientation(	part_type_charge_charger, other.image_angle, other.image_angle, 0, 0, 0);
		part_particles_create(	particle_system, charge_x, charge_y, part_type_charge_charger, 1);	
	}
}