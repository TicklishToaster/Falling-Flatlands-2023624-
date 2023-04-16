// Inherit the parent event
event_inherited();


// If enemy is not onscreen then exit this event and nullify the potentially expensive processes below.
var border_x1 = uc_get_view_x() - Camera.camera_width  / 10;
var border_y1 = uc_get_view_y() - Camera.camera_height / 10;
var border_x2 = uc_get_view_x() + Camera.camera_width  / 10 + Camera.camera_width;
var border_y2 = uc_get_view_y() + Camera.camera_height / 10 + Camera.camera_height;
if (!point_in_rectangle(x, y, border_x1, border_y1, border_x2, border_y2)) {
	exit;
}


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

// Particle FX
if (!charge_enable) {
	exhaust_counter++;
	if(exhaust_counter >= 4){
		exhaust_counter = 0;
		var xx = x - lengthdir_x(sprite_height*0.2, image_angle);
		var yy = y - lengthdir_y(sprite_height*0.2, image_angle);
		with(obj_particles){
			part_particles_create(particle_system, xx, yy, part_type_enemy_exhaust, 1);
		}
	}
}
