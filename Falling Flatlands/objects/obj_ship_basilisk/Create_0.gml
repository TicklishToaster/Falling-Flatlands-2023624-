// Inherit the parent event
event_inherited();


// Dynamic Ship Attributes ////////////////////////////////////////////////////
// Health
health_points			= health_points_max;

// Shield
shield_sprite			= spr_ship_basilisk_shield;
shield_points			= shield_points_max;
shield_enabled_timer	= shield_enabled_timer_max;
shield_recharge_timer	= shield_recharge_timer_max;

// Attack
attack_cooldown_timer	= attack_cooldown_timer_max;
rocket_type				= 1;

// I-Frames
iframes_timer			= iframes_timer_max;

// Targeting
target_list		= ds_grid_create(0, 0);
target_index	= -1;
homing_enabled	= true;
crosshair_target_sprite_id		= spr_selection_crosshair;
crosshair_target_sprite_frame	= 0;
crosshair_target_sprite_speed	= (room_speed / 60 / 1);

// Rocket Data
projectile_target		= noone;
projectile_hp			= 1; //1
projectile_damage		= 2; //1
projectile_speed		= 3; //7
projectile_knockback	= 2; //1

projectile_sprite_id				= spr_rocket;
projectile_sprite_speed				= (room_speed / 60 / 5);
projectile_sprite_colour			= c_white;
projectile_explosion_sprite_id		= spr_explosion_effect_rocket1;
projectile_explosion_sprite_speed	= (room_speed / 60 / 5);
projectile_explosion_sprite_colour	= c_orange;

