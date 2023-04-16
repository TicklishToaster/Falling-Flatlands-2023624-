// Inherit the parent event
event_inherited();


// Dynamic Enemy Attributes ///////////////////////////////////////////////////
// Gun Data
gun_angle				= irandom_range(0, 359);


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
