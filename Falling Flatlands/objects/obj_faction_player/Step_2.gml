// Inherit the parent event
event_inherited();

depth = 0;

// Update Combat Data /////////////////////////////////////////////////////////
#region
// Decrement attack cooldown.
if (attack_cooldown) {
	attack_cooldown_timer = clamp(attack_cooldown_timer - (room_speed / 60 / 60), 0, attack_cooldown_timer_max);
	if (attack_cooldown_timer) <= 0 {
		attack_cooldown = false;
		attack_cooldown_timer = attack_cooldown_timer_max;
	}
}
#endregion

// Update Shield Data /////////////////////////////////////////////////////////
#region
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
#endregion


// Update Invincibility Frames ////////////////////////////////////////////////
#region
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
#endregion


// Calculate Pseudo-I-Frames //////////////////////////////////////////////////
// Countdown collision damage cooldown.
if (collision_damage_cooldown) {
	collision_damage_timer = clamp(collision_damage_timer - (room_speed / 60 / 60), 0, collision_damage_timer_max);
	if (collision_damage_timer) <= 0 {
		collision_damage_cooldown	= false;
		collision_damage_timer		= collision_damage_timer_max;
	}
}


// Calculate Shield Effect Cooldown ///////////////////////////////////////////
// Countdown shield cooldown.
if (shield_effect_cooldown) {
	shield_effect_timer = clamp(shield_effect_timer - (room_speed / 60 / 60), 0, shield_effect_timer_max);
	if (shield_effect_timer) <= 0 {
		shield_effect_cooldown	= false;
		shield_effect_timer	= shield_effect_timer_max;
	}
}


// Room Boundaries ////////////////////////////////////////////////////////////
#region
// Bounce the player off the edges of the room if they attempt to go out of bounds.
var bounce_min = 0.5;
if (bbox_top <= 0) {
	motion_set(-90,	max(vspeed/2, bounce_min));
}

if (bbox_bottom >= room_height) {
	motion_set(90,  max(vspeed/2, bounce_min));
}

if (bbox_left <= 0) {
	motion_set(0,   max(hspeed/2, bounce_min));
}

if (bbox_right >= room_width) {
	motion_set(180, max(hspeed/2, bounce_min));
}
#endregion


// Lose Condition /////////////////////////////////////////////////////////////
if (health_points <= 0) {
    // code here
	audio_play_sound(SFX__FTL____Enemy_Destroy__A_, 10, false);
	//obj_menu.instance_layer_activation = true;
	//instance_activate_object(obj_faction);
	//instance_activate_object(obj_projectile);
	//instance_activate_object(obj_swarmer_drone);
	//Camera.x = obj_menu.camera_last_x;
	//Camera.y = obj_menu.camera_last_y;		
	
	// Play level exit audio clips.
	//audio_play_sound(UI__ITB____Selection_Confirm, 10, false, 0.5);
	audio_play_sound(UI__FTL____Level_Exit, 10, false, 0.5);
	obj_menu.menu_active = true;
	//temp_selected = false;
	room_goto(rm_start);	
	
}


// DEBUG
if (instance_exists(obj_ship_squire)) {
	// Powerup Heal
	if (input_uparrow_press) {
		health_points_max = clamp(health_points_max + 1, 0, 10);
		if (health_points < health_points_max) {
			health_points = clamp(health_points + 1, 0, health_points_max);
		
			// Play audio clip for restoring health.
			audio_stop_sound(UI__ITB____Health_Powerup);
			audio_play_sound(UI__ITB____Health_Powerup, 10, false);
			
			// Trigger flash camera function.
			uc_flash(c_fuchsia, [0.4, 0.1], 0.2);			
		}
	}

	// Powerup Rapid
	if (input_leftarrow_press) {
		attack_cooldown_timer_max = clamp(attack_cooldown_timer_max - 0.1, 0.1, 0.5);	
		if (health_points < health_points_max) {
			health_points = clamp(health_points + 1, 0, health_points_max);
		}
	
		// Play audio clip for restoring health.
		audio_stop_sound(UI__ITB____Rapid_Powerup);
		audio_play_sound(UI__ITB____Rapid_Powerup, 10, false);
			
		// Trigger flash camera function.
		uc_flash(c_orange, [0.4, 0.1], 0.2);
	}

	// Powerup Spread
	if (input_rightarrow_press) {
		attack_spread = clamp(attack_spread + 2, 1, 9);
		if (health_points < health_points_max) {
			health_points = clamp(health_points + 1, 0, health_points_max);
		}	
	
		// Play audio clip for restoring health.
		audio_stop_sound(UI__ITB____Spread_Powerup);
		audio_play_sound(UI__ITB____Spread_Powerup, 10, false);
			
		// Trigger flash camera function.
		uc_flash(c_orange, [0.4, 0.1], 0.2);
	}
}