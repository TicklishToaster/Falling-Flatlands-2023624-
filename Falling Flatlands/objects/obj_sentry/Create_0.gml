// Inherit the parent event
event_inherited();


// Enemy Attributes ///////////////////////////////////////////////////////////
// Health
health_points_max	= 5;
health_points		= 5;

// Movement
max_speed			= 0;
acceleration		= 0.05;
rotation_speed		= 0.5;
knockback_modifier	= 0;
exhaust_counter		= 0;

// Combat
attack_cooldown				= true;
attack_cooldown_timer_max	= 3.0;
attack_cooldown_timer		= attack_cooldown_timer_max;
engagement_range			= 350;
gun_angle					= irandom_range(0, 359);

// Bullet Data
projectile_hp		= 3;
projectile_damage	= 1;
projectile_speed	= 5;
projectile_knockback= 2;

projectile_sprite_id		= spr_laser_bullet_medium_red;
projectile_sprite_speed		= (room_speed / 60 / 2);
projectile_sprite_colour	= c_white;

projectile_explosion_sprite_id		= spr_explosion_effect_gray;
projectile_explosion_sprite_speed	= (room_speed / 60 / 2);
projectile_explosion_sprite_colour	= c_red;
