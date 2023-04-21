// If current object is not onscreen then exit this event and nullify the potentially expensive processes below.
if (!point_in_rectangle(x, y, Camera.border_x1, Camera.border_y1, Camera.border_x2, Camera.border_y2)) {
	exit;
}

// Draw swarmer hull.
draw_sprite_ext(spr_enemy_swarmer, image_index, x, y, 1, 1, image_angle, swarmer_blend, 1);


// Particle FX
var exhaust_limit = 12;
exhaust_counter++;
if (exhaust_counter >= exhaust_limit) {
	exhaust_counter = 0;
	with(obj_particles){
		part_type_alpha2(		part_type_swarmer_image, 1, 0);
		part_type_life(			part_type_swarmer_image, 20, 20);		
		part_type_orientation(	part_type_swarmer_image, other.image_angle, other.image_angle, 0, 0, 0);
		part_type_sprite(		part_type_swarmer_image, spr_enemy_swarmer, false, false, false);
		part_particles_create_color(	particle_system, other.x, other.y, part_type_swarmer_image, other.swarmer_blend, 1);
	}
}