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

//draw_line_width(x, y, x+lengthdir_x(speed*8, direction), y+lengthdir_y(speed*8, direction), 2);

// Inherit the parent event
event_inherited();