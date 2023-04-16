// Inherit the parent event
event_inherited();


// Enemy Attributes ///////////////////////////////////////////////////////////
//// Health
//health_points_max	= 3;
//health_points		= health_points_max;

//// Movement
//max_speed			= 2;	//2
//acceleration		= 0.06; //0.05
//rotation_speed		= 1;	//1
//knockback_modifier	= 1;	//1
//proximity_radius	= 96;
//exhaust_counter		= 0;

//// Combat
//attack_cooldown				= true;
//attack_cooldown_timer_max	= 1.0;
//attack_cooldown_timer		= attack_cooldown_timer_max;
//engagement_range			= 280;

// Bullet Data
projectile_hp		= 1;
projectile_damage	= 1;
projectile_speed	= 5;
projectile_knockback= 0.5;

projectile_sprite_id		= spr_laser_bullet_small_red;
projectile_sprite_speed		= (room_speed / 60 / 5);
projectile_sprite_colour	= c_white;

projectile_explosion_sprite_id		= spr_explosion_effect_grey;
projectile_explosion_sprite_speed	= (room_speed / 60 / 5);
projectile_explosion_sprite_colour	= c_red;