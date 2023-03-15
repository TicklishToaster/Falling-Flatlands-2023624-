// Input Variables ////////////////////////////////////////////////////////////
// Input WASD Controls
var input_up_press			= keyboard_check_pressed(ord("W"));
var input_up_hold			= keyboard_check(ord("W"));
var input_down_press		= keyboard_check_pressed(ord("S"));
var input_down_hold			= keyboard_check(ord("S"));
var input_left_press		= keyboard_check_pressed(ord("A"));
var input_left_hold			= keyboard_check(ord("A"));
var input_right_press		= keyboard_check_pressed(ord("D"));
var input_right_hold		= keyboard_check(ord("D"));

// Input Arrow Key Controls
var input_uparrow_press		= keyboard_check_pressed(vk_up);
var input_uparrow_hold		= keyboard_check(vk_up);
var input_downarrow_press	= keyboard_check_pressed(vk_down);
var input_downarrow_hold	= keyboard_check(vk_down);
var input_leftarrow_press	= keyboard_check_pressed(vk_left);
var input_leftarrow_hold	= keyboard_check(vk_left);
var input_rightarrow_press	= keyboard_check_pressed(vk_right);
var input_rightarrow_hold	= keyboard_check(vk_right);

// Input Mouse Controls
var input_mouse1_click		= mouse_check_button_pressed(mb_left);
var input_mouse1_hold		= mouse_check_button(mb_left);
var input_mouse1_release	= mouse_check_button_released(mb_left);
var input_mouse2_click		= mouse_check_button_pressed(mb_right);
var input_mouse2_hold		= mouse_check_button(mb_right);
var input_mouse2_release	= mouse_check_button_released(mb_right);
var input_mouse4_click		= mouse_check_button_pressed(mb_side1);
var input_mouse5_click		= mouse_check_button_pressed(mb_side2);

// Input Space Bar Controls
var input_space_press		= keyboard_check_pressed(vk_space);
var input_space_hold		= keyboard_check(vk_space);
var input_space_release		= keyboard_check_released(vk_space);

// Input Miscellaneous Controls
var input_shift_press		= keyboard_check_pressed(vk_shift);
var input_shift_hold		= keyboard_check(vk_shift);
var input_control_press		= keyboard_check_pressed(vk_control);
var input_control_hold		= keyboard_check(vk_control);

///////////////////////////////////////////////////////////////////////////////

// Movement Controls //////////////////////////////////////////////////////////
// Accelerate Forward.
if (input_up_hold) {
	// Add Acceleration to Movement.
	motion_add(image_angle, acceleration);
	
	// Particle FX.
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

// Decelerate Backwards.
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


// Rotate Anti-Clockwise.
if input_left_hold {
	image_angle += rotation_speed;
}

// Rotate Ship Clockwise.
if input_right_hold {
	image_angle -= rotation_speed;
}

// Clamp Maximum Speed.
speed = clamp(speed, 0, max_speed);

// Wrap ship to oppisite side of map when out of bounds.
move_wrap(true, true, sprite_width/2); 


// Weapon Controls ////////////////////////////////////////////////////////////
// Fire Ship Weapon.


if (keyboard_check_pressed(ord("1"))) {
	projectile_sprite_id = spr_laser_bullet_tiny_gray;
}
if (keyboard_check_pressed(ord("2"))) {
	projectile_sprite_id = spr_laser_bullet_small_gray;
}
if (keyboard_check_pressed(ord("3"))) {
	projectile_sprite_id = spr_laser_bullet_medium_gray;
}
if (keyboard_check_pressed(ord("4"))) {
	projectile_sprite_id = spr_laser_bullet_large_gray;
}

if (input_space_hold) {
	if (attack_cooldown == false) {
		// Create projectile and set attributes.
		//var bullet = instance_create_layer(x, y, "Instances", obj_projectile);
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
			//show_debug_message(asset_get_index(other))
			//show_debug_message(other)
			//show_debug_message(creator)
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
		attack_cooldown_timer = attack_cooldown_timer_max;
	}
}


// Shield Controls ////////////////////////////////////////////////////////////
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

// Check if shield should be recharging.
if (!shield_recharge && !shield_enabled && shield_points < shield_points_max) {
	shield_recharge = true;
}

// Countdown shield timer and check if shield duration complete.
if (shield_enabled) {
	shield_enabled_timer = clamp(shield_enabled_timer - (room_speed / 60) / 60, 0, shield_enabled_timer_max);
	if (shield_enabled_timer) <= 0 {
		shield_enabled = false;
		shield_enabled_timer = shield_enabled_timer_max;
		audio_play_sound(SFX__FTL____Shield_Off, 10, false);
	}
}

// Countdown shield recharge timer and check if shield should be recharged.
if (shield_recharge && !shield_enabled) {
	shield_recharge_timer = clamp(shield_recharge_timer - (room_speed / 60) / 60, 0, shield_recharge_timer_max);
	// Reset shield recharge timer if complete, increment shield points, and play shield audio.
	if (shield_recharge_timer) <= 0 {
		shield_recharge_timer = shield_recharge_timer_max;
		shield_points = clamp(shield_points + 1, 0, shield_points_max)
		audio_play_sound(SFX__FTL____Select_Down_, 10, false);
		
		// Stop recharging if shield points are at max and play special shield audio.
		if (shield_points >= shield_points_max) {
			shield_recharge = false;
			audio_stop_sound(SFX__FTL____Select_Down_);
			audio_play_sound(SFX__FTL____Select_Up_, 10, false);
		}
	}
}


// Invincibility Frames ///////////////////////////////////////////////////////
// Check if i-frames are enabled.
if (iframes_enabled) {
	// Countdown i-frames duration.
	iframes_timer = clamp(iframes_timer - (room_speed / 60) / 60, 0, iframes_timer_max);	
	
	// Increment i-frames blink value.
	iframes_blink += 1;
	
	// Blink ship sprite every quarter-second.
	if (iframes_blink % 15 == 0 || iframes_blink == 1) {
		switch (image_alpha) {
			case 0.5:
				image_alpha = 1.0;
				break;
			case 1.0:
				image_alpha = 0.5;
				break;
		}
	}

	// Reset i-frame variables when countdown complete.
	if (iframes_timer) <= 0 {
		iframes_enabled = false;
		iframes_timer = iframes_timer_max;
		iframes_blink = 0;
		image_alpha = 1.0;
	}	
}



// Debug
if (input_control_press) {
	health_points -= 1;
	//motion_set()
}

//// Take damage if object is an enemy faction.
//if (input_uparrow_press && !iframes_enabled) {
//	// Cancel damage if shield is active.
//	if (shield_enabled) {
//		audio_play_sound(choose(
//		SFX__FTL____Shield_Hit_Impact__A_,
//		SFX__FTL____Shield_Hit_Impact__B_,
//		SFX__FTL____Shield_Hit_Impact__C_), 
//		10, false)	
//		exit;
//	}	
	
//	// Enable I-Frames.
//	iframes_enabled = true;
	
//	// Change health.
//	health_points -= 1;

//	// Play audio clip for taking damage.
//	audio_play_sound(SFX__ITB____Ship_Damage, 10, false);

//	// Play special audio clip if health is critical.
//	if (health_points == 1) {
//		audio_play_sound(UI__ITB____Critical_Health, 10, false);
//	}
//}


