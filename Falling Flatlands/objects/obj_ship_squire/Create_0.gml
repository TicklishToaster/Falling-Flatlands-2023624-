// Inherit the parent event
event_inherited();

//x = room_width/2
//y = room_height/2

// Ship Attributes ////////////////////////////////////////////////////////////
// Health
health_points_max	= 5;
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
max_speed			= 4;
acceleration		= 0.05;
rotation_speed		= 3;
knockback_modifier	= 1;
exhaust_counter		= 0;

// Combat
attack_cooldown				= false;
attack_cooldown_timer_max	= 0.5;
attack_cooldown_timer		= attack_cooldown_timer_max;

// Bullet Data
projectile_hp		= 1; //1
projectile_damage	= 1; //1
projectile_speed	= 7; //7
projectile_knockback= 1; //1

projectile_sprite_id		= spr_laser_bullet_medium_grey;
projectile_sprite_speed		= (room_speed / 60 / 5);
projectile_sprite_colour	= c_orange;

projectile_explosion_sprite_id		= spr_explosion_effect_grey;
projectile_explosion_sprite_speed	= (room_speed / 60 / 5);
projectile_explosion_sprite_colour	= c_orange;
