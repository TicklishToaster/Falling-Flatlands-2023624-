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


// Attack the player when in engagement range.
if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range && 
	collision_line(x, y, obj_faction_player.x, obj_faction_player.y, obj_faction_enemy, true, true) == noone) 
	{
	// Determine the angle required to face the target ship.
	var new_angle = point_direction(x, y, obj_faction_player.x, obj_faction_player.y);
	
	// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
	new_angle = angle_difference(new_angle, image_angle);		
		
	// Fire Projectile
	if (abs(new_angle) < 10 && attack_cooldown == false) {
		// Create projectile and set attributes.	
		with (instance_create_layer(x, y, "Instances", obj_projectile)) {
			creator					= other;		
			faction					= other.faction;
			projectile_hp			= other.projectile_hp;
			projectile_damage		= other.projectile_damage;
			projectile_speed		= other.projectile_speed;
			projectile_knockback	= other.projectile_knockback;
			projectile_direction	= other.image_angle;
			projectile_sprite_id	= other.projectile_sprite_id;
			projectile_sprite_speed	= other.projectile_sprite_speed;
			projectile_sprite_colour= other.projectile_sprite_colour;
			explosion_sprite_id		= other.projectile_explosion_sprite_id;
			explosion_sprite_speed	= other.projectile_explosion_sprite_speed;
			explosion_sprite_colour	= other.projectile_explosion_sprite_colour;
			sprite_index			= projectile_sprite_id;
			speed					= projectile_speed;
			direction				= projectile_direction;
			depth					= other.depth + 1;
		}

		// Play shoot audio.
		audio_play_sound(choose(
		SFX__FTL____Energy_Shot_Light__A_,
		SFX__FTL____Energy_Shot_Light__B_,
		SFX__FTL____Energy_Shot_Light__C_), 
		10, false);
	
		// Enable attack cooldown.
		attack_cooldown = true;
	}
}

// Countdown attack cooldown.
if (attack_cooldown) {
	attack_cooldown_timer = clamp(attack_cooldown_timer - (room_speed / 60 / 60), 0, attack_cooldown_timer_max);
	if (attack_cooldown_timer) <= 0 {
		attack_cooldown = false;
		attack_cooldown_timer = attack_cooldown_timer_max + random_range(-attack_cooldown_timer_max/8, +attack_cooldown_timer_max/8);
	}
}

//// Particle FX
//exhaust_counter++;
//if(exhaust_counter >= 4){
//	exhaust_counter = 0;
//	var xx = x - lengthdir_x(sprite_height*0.2, image_angle);
//	var yy = y - lengthdir_y(sprite_height*0.2, image_angle);
//	with(obj_particles){
//		part_particles_create(particle_system, xx, yy, part_type_enemy_exhaust, 1);
//	}
//}