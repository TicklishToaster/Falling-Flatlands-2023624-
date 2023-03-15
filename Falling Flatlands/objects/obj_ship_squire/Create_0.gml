// Inherit the parent event
event_inherited();

x = room_width/2
y = room_height/2

// Ship Attributes ////////////////////////////////////////////////////////////
// Health
health_points_max	= 5;
health_points		= 5;

// Shield
shield_points_max		= 5;
shield_points			= 5;
shield_enabled			= false;
shield_recharge			= false;

shield_enabled_timer_max	= 2;
shield_recharge_timer_max	= 3;
shield_enabled_timer	= shield_enabled_timer_max;
shield_recharge_timer	= shield_recharge_timer_max;

shield_surface		= -1;
//shield_impact_x		= 0;
//shield_impact_y		= 0;
//impact_direction		= 0;
//angle_at_impact		= 0;
//distance_to_impact	= 0;
//dissipate_timer		= 0;

// I-Frames
iframes_enabled		= false;
iframes_timer_max	= 1;
iframes_timer		= iframes_timer_max;
iframes_blink		= 0;

// Movement
max_speed			= 10;
//current_speed		= 0;
acceleration		= 0.05;
rotation_speed		= 5;
knockback_modifier	= 1;
exhaust_counter		= 0;

// Combat
attack_cooldown				= false;
attack_cooldown_timer_max	= 0.5;
attack_cooldown_timer		= attack_cooldown_timer_max;

// Bullet Data
projectile_hp		= 3;
projectile_damage	= 1;
projectile_speed	= 7;
projectile_knockback= 1;

projectile_sprite_id		= spr_laser_bullet_small_gray;
projectile_sprite_speed		= (room_speed / 60 / 20);
projectile_sprite_colour	= c_orange;

projectile_explosion_sprite_id		= spr_explosion_effect_gray;
projectile_explosion_sprite_speed	= (room_speed / 60 / 2);
projectile_explosion_sprite_colour	= c_orange;

//projectile_sprite_id	= 0;

//projectile_sprite	= spr_laser_bullet_small_gray;
//projectile_speed	= 7;
//projectile_damage	= 1;
//projectile_colour	= c_orange;
//projectile_destroy_sprite = spr_explosion_effect_gray;

//projectile_properties = [obj_bullet, faction]

//create_bullet(obj_bullet, faction, speed, image_angle, projectile_sprite, projectile_speed, projectile_damage, c_orange);

// Movement Vars //////////////////////////////////////////////////////////////
// Movement Vars //////////////////////////////////////////////////////////////



//shield_impact_position =   [[false, 0, 0, 0, 0, 0, 0], 
//							[false, 0, 0, 0, 0, 0, 0], 
//							[false, 0, 0, 0, 0, 0, 0], 
//							[false, 0, 0, 0, 0, 0, 0], 
//							[false, 0, 0, 0, 0, 0, 0]]
							
//shield_impact_position = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
//shield_impact_position = [[0, 0], [1, 1], [2, 2], [3, 3], [4, 4]]

//for (var i = 0; i < array_length(shield_impact_position); i += 1) {
//	show_debug_message(shield_impact_position[i])
//}


obj_camera.target = self;
