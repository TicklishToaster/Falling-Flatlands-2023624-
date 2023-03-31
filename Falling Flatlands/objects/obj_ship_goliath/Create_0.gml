// Inherit the parent event
event_inherited();


// Dynamic Ship Attributes ////////////////////////////////////////////////////
// Health
health_points			= health_points_max;

// Shield
shield_sprite			= spr_ship_goliath_shield;
shield_points			= shield_points_max;
shield_enabled_timer	= shield_enabled_timer_max;
shield_recharge_timer	= shield_recharge_timer_max;

// Attack
attack_cooldown_timer	= attack_cooldown_timer_max;

// I-Frames
iframes_timer			= iframes_timer_max;

// Bullet Data
projectile_hp			= 3; //1
projectile_damage		= 3; //1
projectile_speed		= 6; //7
projectile_knockback	= 2; //1

projectile_sprite_id		= spr_laser_bullet_giant_grey;
projectile_sprite_speed		= (room_speed / 60 / 5);
projectile_sprite_colour	= c_orange;

projectile_explosion_sprite_id		= spr_explosion_effect_grey;
projectile_explosion_sprite_speed	= (room_speed / 60 / 5);
projectile_explosion_sprite_colour	= c_orange;
