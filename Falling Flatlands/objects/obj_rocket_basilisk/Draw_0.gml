// Draw sprite.
draw_sprite_ext(sprite_index, projectile_sprite_frame, x, y, 1, 1, image_angle, projectile_sprite_colour, 1);

// Particle FX
exhaust_counter++;
if(exhaust_counter >= 4){
	exhaust_counter = 0;
	var xx = x - lengthdir_x(sprite_height*0.2, image_angle);
	var yy = y - lengthdir_y(sprite_height*0.2, image_angle);
	with(obj_particles){
		part_particles_create(particle_system, xx, yy, part_type_ship_exhaust, 1);
	}
}