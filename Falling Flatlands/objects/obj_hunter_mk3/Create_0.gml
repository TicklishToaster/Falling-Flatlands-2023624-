// Inherit the parent event
event_inherited();


// Dynamic Enemy Attributes ///////////////////////////////////////////////////
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