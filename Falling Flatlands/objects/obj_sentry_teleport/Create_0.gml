// Inherit the parent event
event_inherited();


// Dynamic Enemy Attributes ///////////////////////////////////////////////////
// Teleport Data
previous_x = 0;
previous_y = 0;
teleport_x = 0;
teleport_y = 0;

teleport_cooldown			= true;
teleport_cooldown_timer_max	= 8.0;
teleport_cooldown_timer		= teleport_cooldown_timer_max;
teleport_fired				= false;
teleport_ring				= false


// Gun Data
gun_angle_1	= 0;
gun_angle_2	= 45;
gun_angle_3	= 90;
gun_angle_4	= 135;
gun_angle_5	= 180;
gun_angle_6	= 225;
gun_angle_7	= 270;
gun_angle_8	= 315;

gun_angles = [
	gun_angle_1, gun_angle_2, gun_angle_3, gun_angle_4, 
	gun_angle_5, gun_angle_6, gun_angle_7, gun_angle_8
	];
gun_angles_previous = [
	gun_angle_1, gun_angle_2, gun_angle_3, gun_angle_4, 
	gun_angle_5, gun_angle_6, gun_angle_7, gun_angle_8
	];

// Bullet Data
projectile_hp		= 3;
projectile_damage	= 1;
projectile_speed	= 5;
projectile_knockback= 2;

projectile_sprite_id		= spr_laser_bullet_large_red;
projectile_sprite_speed		= (room_speed / 60 / 5);
projectile_sprite_colour	= c_white;

projectile_explosion_sprite_id		= spr_explosion_effect_grey;
projectile_explosion_sprite_speed	= (room_speed / 60 / 5);
projectile_explosion_sprite_colour	= c_red;
