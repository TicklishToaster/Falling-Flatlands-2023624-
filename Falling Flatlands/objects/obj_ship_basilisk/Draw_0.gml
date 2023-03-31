// Draw Propusion Effects /////////////////////////////////////////////////////
// Particle FX.
if (input_up_hold) {
	exhaust_counter++;
	if(exhaust_counter >= 4){
		exhaust_counter = 0;
		var n1 = 0.15;
		var xx = x - lengthdir_x(sprite_height*0.2, image_angle);
		var yy = y - lengthdir_y(sprite_height*0.2, image_angle);
		var xx2 = x - lengthdir_x(sprite_height*n1, image_angle);
		var yy2 = y - lengthdir_y(sprite_height*n1, image_angle);
		with(obj_particles){
			var n = 15;
			part_particles_create(particle_system, xx, yy+00, part_type_ship_exhaust_large, 1);
			part_particles_create(particle_system, xx2+lengthdir_x(n, other.image_angle+90), yy2+lengthdir_y(n, other.image_angle+90), part_type_ship_exhaust_large, 1);
			part_particles_create(particle_system, xx2-lengthdir_x(n, other.image_angle+90), yy2-lengthdir_y(n, other.image_angle+90), part_type_ship_exhaust_large, 1);
		}
	}
}


// Draw Ship Hull /////////////////////////////////////////////////////////////
draw_sprite_ext(sprite_index, -1, x, y, 1, 1, image_angle, c_aqua, image_alpha);


// Inherit the parent event
event_inherited();


// Draw Rocket Sprite /////////////////////////////////////////////////////////
if (!attack_cooldown) {
	draw_sprite_ext(projectile_sprite_id, rocket_type-1, x-lengthdir_x(2, image_angle), y-lengthdir_y(2, image_angle), 1, 1, image_angle, c_aqua, image_alpha);
}


// Draw Target Crosshair //////////////////////////////////////////////////////
if (instance_exists(projectile_target) && homing_enabled) {
	draw_sprite_ext(crosshair_target_sprite_id, crosshair_target_sprite_frame, projectile_target.x, projectile_target.y, 1, 1, 0, c_orange, 1);
}


//draw_rectangle(
//	//x - lengthdir_x(sprite_width /2, image_angle), 
//	//y - lengthdir_y(sprite_height/2, image_angle), 
//	//x + lengthdir_x(sprite_width /2, image_angle), 
//	//y + lengthdir_y(sprite_height/2, image_angle), 
//	x - sprite_width /4,
//	y - sprite_height/4,
//	x + sprite_width /4,
//	y + sprite_height/4,
//	true)