// Inherit the parent event
event_inherited();


// If enemy is not onscreen then exit this event and nullify the potentially expensive processes below.
if (!point_in_rectangle(x, y, Camera.border_x1, Camera.border_y1, Camera.border_x2, Camera.border_y2)) {
	exit;
}


//// Attack the player when in engagement range and no allied objects are obstructing l.o.s.
//if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range && 
//	collision_line(x, y, obj_faction_player.x, obj_faction_player.y, obj_faction_enemy, true, true) == noone) 
//	{
// Attack the player when in engagement range.
if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range) {
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
		SFX__FTL____Enemy_Hunter_Shot__A_,
		SFX__FTL____Enemy_Hunter_Shot__B_,
		SFX__FTL____Enemy_Hunter_Shot__C_), 
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