/// @description Create Bullet
/// @arg bullet type
/// @arg creator_faction
/// @arg creator_speed
/// @arg creator_direction
/// @arg bullet_sprite
/// @arg bullet_destroy_sprite
/// @arg bullet_speed
/// @arg* bullet_damage
/// @arg* bullet_colour



//function create_bullet(	projectile_id, projectile_creator, projectile_faction, 
//						projectile_hp, projectile_damage, projectile_speed,
//						projectile_sprite_id, projectile_sprite_speed, projectile_sprite_colour,
//						explosion_sprite_id, explosion_sprite_speed) {
							
						//}
function create_bullet(	obj_ID, creator_faction, creator_speed, creator_direction, 
						bullet_sprite, bullet_destroy_sprite, 
						bullet_speed, bullet_damage = 1, bullet_colour = c_white){
	var origin = self;
	
	var bullet = instance_create_layer(x, y, "Instances", obj_ID);	
	with bullet {
		creator			= origin;
		faction			= creator_faction;
		speed			= creator_speed + bullet_speed;
		direction		= creator_direction;
		sprite_index	= bullet_sprite;
		destroy_sprite	= bullet_destroy_sprite;
		image_angle		= creator_direction;
		image_blend		= bullet_colour;
	}		
	
	
	//if (fact = factions.ally){
	//	if pow.rapid_shot {col = c_orange;}
	//	power_combo[pow.spread_shot][pow.scatter_shot](type, origin, fact, dir, spd, col);
	//} else {
	//	col = c_red;
	//	power_combo[0][0](type, origin, fact, dir, spd, col);
	//}
}


//function default_bullet(type, origin, fact, dir, spd, col){
//	//var bullet = instance_create_layer(x+lengthdir_x(18, image_angle), y+lengthdir_y(18, image_angle), "Instances", type);
//	var bullet = instance_create_layer(x, y, "Instances", type);	
//	with bullet {
//		creator		= origin;
//		faction		= fact;
//		speed		= spd;
//		direction	= dir;
//		image_angle = dir;
//		image_blend = col;
//	}	
//}