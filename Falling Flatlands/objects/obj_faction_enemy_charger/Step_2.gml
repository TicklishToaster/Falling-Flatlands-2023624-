// Inherit the parent event
event_inherited();


// If enemy is not onscreen then exit this event and nullify the potentially expensive processes below.
if (!point_in_rectangle(x, y, 
	obj_camera.x - obj_camera.camera_width  / 10, 
	obj_camera.y - obj_camera.camera_height / 10, 
	obj_camera.x + obj_camera.camera_width  + obj_camera.camera_width  / 10, 
	obj_camera.y + obj_camera.camera_height + obj_camera.camera_height / 10)) 
	{
	exit;
}

//// Attack the player when in engagement range.
//if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range) {
//	if (charge_enable && charge_complete) {
//		boosting = true;
//		charge_enable = false;
//		charge_complete = false;
//		charge_timer = charge_timer_max;
//		max_speed = max_speed_boosted;
//		boost_location_x = x;
//		boost_location_y = y;
		
		
//		// Reset and apply new motion to the ship.
//		motion_set(image_angle, max(0.1, speed));
//		motion_add(image_angle, max_speed);
//		//speed = clamp(max_speed_default + (max_speed_default * booster_charge_timer/booster_charge_timer_max), 0, max_speed_boosted);
			
//		// Play audio clip
//		audio_play_sound(SFX__ITB____Artemis_Launch_Normal, 10, false, 0.5);
//	}
	
//}

//if (charge_enable) {
//	charge_timer = clamp(charge_timer - (room_speed / 60 / 60), 0, charge_timer_max);
//	if (charge_timer) <= 0 {
//		charge_complete = true;
//	}
//}

//show_debug_message(charge_timer)

// Countdown attack cooldown.
if (attack_cooldown) {
	attack_cooldown_timer = clamp(attack_cooldown_timer - (room_speed / 60 / 60), 0, attack_cooldown_timer_max);
	if (attack_cooldown_timer) <= 0 {
		attack_cooldown = false;
		attack_cooldown_timer = attack_cooldown_timer_max + random_range(-attack_cooldown_timer_max/8, +attack_cooldown_timer_max/8);
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
