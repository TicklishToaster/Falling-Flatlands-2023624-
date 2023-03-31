// Movement Controls //////////////////////////////////////////////////////////
#region
// Accelerate forwards.
if (input_up_hold) {
	// Add acceleration to motion.
	motion_add(image_angle, acceleration);
}

// Decelerate backwards.
if (input_down_hold) {
	// Determine a minimum value to decelerate the ship with.
	var reverse_speed = max(lerp(0, speed, 0.01), acceleration);
	
	// Decrease ship speed (minimum 0).
	speed = clamp(speed-reverse_speed, 0, speed);
}

// Gradually decelerate ship if no input is given.
if (!input_up_hold && !input_down_hold) {
	// Decrease ship speed (minimum 0).
	speed = clamp(speed-0.01, 0, speed);
}

// Rotate anti-clockwise.
if input_left_hold {
	image_angle += rotation_speed;
}

// Rotate clockwise.
if input_right_hold {
	image_angle -= rotation_speed;
}
#endregion

// Clamp maximum speed.
speed = clamp(speed, 0, max_speed);


// Weapon Controls ////////////////////////////////////////////////////////////
#region
// Fire ship weapon.
if (input_space_hold) {
	if (attack_cooldown == false) {
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
			depth					= other.depth - 1;
			x						+= lengthdir_x(other.speed*8, other.direction);
			y						+= lengthdir_y(other.speed*8, other.direction);
		}

		// Play shoot audio.
		audio_play_sound(SFX__FTL____Energy_Shot_Super__A_,	10, false);
		
		// Toggle Camera Shake
		uc_shake(2, 0.1);
		uc_hit(image_angle-180, 2, 0.1);
		
		// Enable attack cooldown.
		attack_cooldown = true;
	}
}
#endregion


// Shield Controls ////////////////////////////////////////////////////////////
#region
// Toggle Ship Shield
if (input_shift_hold) {
	if (shield_points > 0 && !shield_enabled) {
		shield_points -= 1;
		shield_enabled = true;
		audio_play_sound(SFX__FTL____Shield_On, 10, false);
	}
	
	// Play "Fail" audio if shield toggle is impossible.
	else if (input_shift_press) {
		audio_play_sound(SFX__FTL____Select_Fail_, 10, false);
	}
}
#endregion