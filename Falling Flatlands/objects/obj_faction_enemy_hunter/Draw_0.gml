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