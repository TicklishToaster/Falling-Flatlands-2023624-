// Inherit the parent event
event_inherited();

// Ship Attributes ////////////////////////////////////////////////////////////
// Health
health_points_max	= 4;
health_points		= health_points_max;

// Shield
shield_points_max		= 5;
shield_points			= shield_points_max;
shield_enabled			= false;
shield_recharge			= false;

shield_enabled_timer_max	= 2;
shield_recharge_timer_max	= 3;
shield_enabled_timer	= shield_enabled_timer_max;
shield_recharge_timer	= shield_recharge_timer_max;

shield_surface		= -1;

// I-Frames
iframes_enabled		= false;
iframes_timer_max	= 1;
iframes_timer		= iframes_timer_max;
iframes_blink		= 0;

// Movement
max_speed_current		= 10;	// 6
max_speed_default		= max_speed_current;
max_speed_boosted		= max_speed_current*2;

acceleration			= 0.10;	// 0.05

rotation_speed_current	= 3;
rotation_speed_default	= rotation_speed_current;
rotation_speed_boosted	= rotation_speed_current/(rotation_speed_current*2);

knockback_modifier		= 1;	// 1
exhaust_counter			= 0;

// Charge
boost_mode			= false;
booster_charge_enable	= false;
booster_charge_complete	= false;
booster_charge_timer_max= 2.0;
booster_charge_timer	= 0;
charge_surface = -1;


// Combat
attack_cooldown				= false;
attack_cooldown_timer_max	= 0.5;
attack_cooldown_timer		= attack_cooldown_timer_max;


// Grappling
grapple_mode	= false;
grapple_target	= noone;
grapple_length	= 0;
grapple_angle	= 0;
grapple_orient	= 1;

target_list		= ds_grid_create(0, 0);
//target_index	= -1;
crosshair_target_sprite_id		= spr_selection_crosshair;
crosshair_target_sprite_frame	= 0;
crosshair_target_sprite_speed	= (room_speed / 60 / 1);

//// Bullet Data
//projectile_hp		= 1; //1
//projectile_damage	= 1; //1
//projectile_speed	= 7; //7
//projectile_knockback= 1; //1

//projectile_sprite_id		= spr_laser_bullet_medium_grey;
//projectile_sprite_speed		= (room_speed / 60 / 5);
//projectile_sprite_colour	= c_orange;

//projectile_explosion_sprite_id		= spr_explosion_effect_grey;
//projectile_explosion_sprite_speed	= (room_speed / 60 / 5);
//projectile_explosion_sprite_colour	= c_orange;

