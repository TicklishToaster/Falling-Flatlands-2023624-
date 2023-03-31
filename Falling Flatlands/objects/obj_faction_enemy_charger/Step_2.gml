// Inherit the parent event
event_inherited();


// If enemy is not onscreen then exit this event and nullify the potentially expensive processes below.
if (!point_in_rectangle(x, y, 
	Camera.x - Camera.camera_width  / 10, 
	Camera.y - Camera.camera_height / 10, 
	Camera.x + Camera.camera_width  + Camera.camera_width  / 10, 
	Camera.y + Camera.camera_height + Camera.camera_height / 10)) 
	{
	exit;
}

//// Countdown attack cooldown.
//if (attack_cooldown) {
//	attack_cooldown_timer = clamp(attack_cooldown_timer - (room_speed / 60 / 60), 0, attack_cooldown_timer_max);
//	if (attack_cooldown_timer) <= 0 {
//		attack_cooldown = false;
//	}
//}

//// Particle FX
//if (!charge_enable) {
//	exhaust_counter++;
//	if(exhaust_counter >= 4){
//		exhaust_counter = 0;
//		var xx = x - lengthdir_x(sprite_height*0.2, image_angle);
//		var yy = y - lengthdir_y(sprite_height*0.2, image_angle);
//		with(obj_particles){
//			part_particles_create(particle_system, xx, yy, part_type_enemy_exhaust, 1);
//		}
//	}
//}
