// Inherit the parent event
event_inherited();


// Rotate ship toward the new angle at set rotation speed if player is in engagement range.
if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range {
	var ship_rotation		= rotation_speed;
	var ship_acceleration	= acceleration;
}

// Rotate ship toward the new angle at set rotation speed x2 if player is out of engagement range.
else if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range {
	var ship_rotation		= rotation_speed*2;
	var ship_acceleration	= acceleration*2;
}

// Determine the angle required to face the target ship.
var new_angle = point_direction(x, y, obj_faction_player.x, obj_faction_player.y);
	
// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
new_angle = angle_difference(new_angle, image_angle);

image_angle += clamp(new_angle, -ship_rotation, ship_rotation);

//// Rotate ship toward the new angle at set rotation speed if player is in engagement range.
//if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range {
//	image_angle += clamp(new_angle, -rotation_speed, rotation_speed);
//}

//// Rotate ship toward the new angle at set rotation speed x2 if player is out of engagement range.
//else if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range {
//	image_angle += clamp(new_angle, -rotation_speed*2, rotation_speed*2);
//}

// Move in the direction of the current angle.
//direction = image_angle;

// Move away from the player if too close.
if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range/2 {
	//speed -= acceleration;
	// Add Acceleration to Movement.
	motion_add(image_angle, -ship_acceleration);	
}
// Move toward the player if too far.
else if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) > engagement_range/2 {
	//speed += acceleration/4;
	// Add Acceleration to Movement.
	motion_add(image_angle, ship_acceleration/4);	
}

//// Move toward the player if out of engagement range.
//else if point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range {
//	//speed += acceleration/4;
//	// Add Acceleration to Movement.
//	motion_add(image_angle, acceleration/2);	
//}

// Push away from other enemy objects if too close.
for (var i = 0; i < instance_number(obj_faction_enemy); i += 1) {
	var target_inst = instance_find(obj_faction_enemy, i);
	if (target_inst == id) {
		continue;
	}
	if (point_in_circle(target_inst.x, target_inst.y, x, y, proximity_radius)) {
		var target_dir = point_direction(x, y, target_inst.x, target_inst.y);
		motion_add(target_dir-180, acceleration);
	}
}

// Attack the player when in engagement range.
if (point_distance(x, y, obj_faction_player.x, obj_faction_player.y) < engagement_range && 
	collision_line(x, y, obj_faction_player.x, obj_faction_player.y, obj_faction_enemy, true, true) == noone) {
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
//}

// Countdown attack cooldown.
if (attack_cooldown) {
	attack_cooldown_timer = clamp(attack_cooldown_timer - (room_speed / 60 / 60), 0, attack_cooldown_timer_max);
	if (attack_cooldown_timer) <= 0 {
		attack_cooldown = false;
		attack_cooldown_timer = attack_cooldown_timer_max + random_range(-attack_cooldown_timer_max/8, +attack_cooldown_timer_max/8);
	}
}

// Clamp Maximum Speed.
speed = clamp(speed, -max_speed/2, max_speed);
