// Draw Propusion Effects /////////////////////////////////////////////////////
// Particle FX.
if (input_up_hold) {
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


// Draw Ship Hull /////////////////////////////////////////////////////////////
draw_sprite_ext(sprite_index, -1, x, y, 1, 1, image_angle, c_aqua, image_alpha);


// Inherit the parent event
event_inherited();