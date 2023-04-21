// Inherit the parent event
event_inherited();

// If enemy is not onscreen then exit this event and nullify the potentially expensive processes below.
if (!point_in_rectangle(x, y, Camera.border_x1, Camera.border_y1, Camera.border_x2, Camera.border_y2)) {
	exit;
}

// Particle FX
exhaust_counter++;
if(exhaust_counter >= 4){
	exhaust_counter = 0;
	var xx = x - lengthdir_x(sprite_height*0.2, image_angle);
	var yy = y - lengthdir_y(sprite_height*0.2, image_angle);
	with(obj_particles){
		part_particles_create(particle_system, xx, yy, part_type_enemy_exhaust, 1);
	}
}