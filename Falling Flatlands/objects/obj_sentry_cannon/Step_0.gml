// Inherit the parent event
event_inherited();


// Determine the angle required to face the target ship.
var new_angle = point_direction(x, y, obj_faction_player.x, obj_faction_player.y);
	
// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
new_angle = angle_difference(new_angle, gun_angle);
	
// Rotate ship gun toward new angle at set turn speed.
gun_angle += clamp(new_angle, -rotation_speed, rotation_speed);

// If player is in range.
if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range) {
	//// Determine the angle required to face the target ship.
	//var new_angle = point_direction(x, y, obj_faction_player.x, obj_faction_player.y);
	
	//// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
	//new_angle = angle_difference(new_angle, gun_angle);
	
	//// Rotate ship gun toward new angle at set turn speed.
	//gun_angle += clamp(new_angle, -rotation_speed, rotation_speed);
	
	// Fire Projectile
	if (abs(new_angle) < 15 && attack_cooldown == false) {
		// Create projectile and set attributes.	
		with (instance_create_layer(x, y, "Instances", obj_projectile)) {
			creator					= other;		
			faction					= other.faction;
			projectile_hp			= other.projectile_hp;
			projectile_damage		= other.projectile_damage;
			projectile_speed		= other.projectile_speed;
			projectile_knockback	= other.projectile_knockback;
			projectile_direction	= other.gun_angle;
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
		
		
		audio_stop_sound(SFX__FTL____Energy_Shot_Heavy__A_);
		audio_stop_sound(SFX__FTL____Energy_Shot_Heavy__B_);
		audio_stop_sound(SFX__FTL____Energy_Shot_Heavy__C_);		

		// Play shoot audio.
		audio_play_sound(choose(
		SFX__FTL____Energy_Shot_Heavy__A_,
		SFX__FTL____Energy_Shot_Heavy__B_,
		SFX__FTL____Energy_Shot_Heavy__C_), 
		10, false, 0.7);
	
		// Enable attack cooldown.
		attack_cooldown = true;
	}
	
	// Clamp speed.
	speed = clamp(speed, 0, 0);
}
//// If player is out of range.
//else if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range) {
//	// Slowly move towards the player.
//	var new_direction = point_direction(x, y, obj_faction_player.x, obj_faction_player.y);
//	motion_add(new_direction, acceleration);
	
//	// Clamp speed.
//	speed = clamp(speed, -max_speed, max_speed);
//}





