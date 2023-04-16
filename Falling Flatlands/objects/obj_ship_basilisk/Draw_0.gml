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


// Draw Rocket Sprite /////////////////////////////////////////////////////////
if (!attack_cooldown) {
	draw_sprite_ext(projectile_sprite_id, rocket_type-1, x-lengthdir_x(2, image_angle), y-lengthdir_y(2, image_angle), 1, 1, image_angle, c_aqua, image_alpha);
}


// Draw Target Crosshair //////////////////////////////////////////////////////
if (rocket_type != 3) {
	if (instance_exists(projectile_target) && homing_enabled) {
		draw_sprite_ext(crosshair_target_sprite_id, crosshair_target_sprite_frame, projectile_target.x, projectile_target.y, 1, 1, 0, c_orange, 1);
	}
}