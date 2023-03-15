// TEST FUNCTION: Toggles powerups based on number key pressed. DELETE LATER
switch (keyboard_key){
	case ord("0"): 
		ship_powerups.spread_shot	= false;
		ship_powerups.scatter_shot	= false;
		ship_powerups.laser_shot	= false;
		ship_powerups.rapid_shot	= false;		
		ship_shield_enabled			= false;
		break;
	case ord("1"): 
		ship_powerups.spread_shot	= true; 
		break;
	case ord("2"): 
		ship_powerups.scatter_shot	= true; 
		break;	
	case ord("3"): 
		ship_powerups.rapid_shot	= true; 
		ship_attack_speed = 0.1;
		powerup_timer = 8;
		alarm[2] = room_speed * 0.1;
		break;	
	case ord("4"): 
		ship_powerups.laser_shot	= true; 
		break;
}if ship_powerups.rapid_shot == false {ship_attack_speed = 0.5}

if keyboard_check_pressed(ord("5")){
	ship_shield_enabled = true;
	ship_shield_power = 10;
}
if keyboard_check_pressed(ord("6")){
	ship_hp -= 1;
}

// Move Ship Forward.
if keyboard_check(ord("W")) && !instance_exists(obj_grapple_hook){
	motion_add(image_angle, 0.05);
	
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
}


// Decelerate the ship until it halts.
if keyboard_check(ord("S")) {
	// Determine a minimum value to decelerate the ship by.
	var reverse_speed = max(lerp(0, speed, 0.01), 0.05);
	// Set new speed and prevent going backwards.
	speed = clamp(speed-reverse_speed, 0, speed);	
}


// Rotate Ship Anti-clockwise.
if keyboard_check(ord("A")) && !instance_exists(obj_grapple_hook){
	image_angle += 5;
}


// Rotate Ship Clockwise.
if keyboard_check(ord("D")) && !instance_exists(obj_grapple_hook){
	image_angle -= 5;
}


// Set max ship speed.
speed = clamp(speed, 0, ship_max_speed);
// Wrap ship to oppisite side of map when out of bounds.
move_wrap(true, true, sprite_width/2); 


// Shoot Ship Weapons
// Projectile
if keyboard_check(vk_space) && ship_attack_cooldown == false{
	bullet_spd = speed + 8;
	spawn_bullet(obj_bullet, image_angle, bullet_spd, faction, ship_powerups);
	audio_play_sound(choose(
	SFX__FTL____Energy_Shot_Light__A_,
	SFX__FTL____Energy_Shot_Light__B_,
	SFX__FTL____Energy_Shot_Light__C_
	), 10, false);
	ship_attack_cooldown = true;
	alarm[0] = ship_attack_speed * room_speed;
} 
// Laser
if keyboard_check(vk_space) && ship_powerups.laser_shot {
	spawn_orbitor_laser(orbitor_rot, faction, ship_powerups);
	if !audio_is_playing(SFX__FTL____Laser_Beam) {
		audio_play_sound(SFX__FTL____Laser_Beam, 10, true);
	}
} else if audio_is_playing(SFX__FTL____Laser_Beam){
	audio_stop_sound(SFX__FTL____Laser_Beam);
}


// Toggle Ship Shield
if keyboard_check(vk_shift) && ship_shield_power > 0 {
	ship_shield_enabled = true;
	ship_shield_power = clamp(ship_shield_power-0.05, 0, 10);
	if keyboard_check_pressed(vk_shift) {
		audio_play_sound(SFX__FTL____Shield_On, 10, false);
	}
}
if keyboard_check_released(vk_shift) && ship_shield_power > 0 {
	ship_shield_enabled = false;
	audio_play_sound(SFX__FTL____Shield_Off, 10, false);
}
if ship_shield_power == 0 && ship_shield_enabled {
	ship_shield_enabled = false;
	audio_play_sound(SFX__ITB__Shield_Down, 10, false);
}


// Grapple Intialize
if mouse_check_button_pressed(mb_left) && collision_rectangle(mouse_x-10, mouse_y-10, mouse_x+10, mouse_y+10, obj_asteroid, true, false){
	var target = collision_rectangle(mouse_x-10, mouse_y-10, mouse_x+10, mouse_y+10, obj_asteroid, true, false);
	if point_distance(x, y, target.x, target.y) < 350 {
		// The "Create" event for the new instance is automatically run first. The variable set below comes after.
		instance_create_layer(x, y, "Instances", obj_grapple_hook, {creator : obj_ship})
		audio_play_sound(SFX__HOH____Grapple_Hit, 10, false);		
	}	
}

// Destroy grapple if user lets go of Mouse 1.
if mouse_check_button_released(mb_left) && instance_exists(obj_grapple_hook){
	instance_destroy(obj_grapple_hook);
	audio_play_sound(SFX__HOH____Grapple_Release, 10, false);
}