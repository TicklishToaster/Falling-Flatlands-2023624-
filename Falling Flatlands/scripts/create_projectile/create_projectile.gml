/// @description Create Projectile
/// @arg projectile_id
/// @arg projectile_creator
/// @arg projectile_faction
/// @arg projectile_hp
/// @arg projectile_damage
/// @arg projectile_speed
/// @arg projectile_sprite_id
/// @arg projectile_sprite_speed
/// @arg projectile_sprite_colour
/// @arg explosion_sprite_id
/// @arg explosion_sprite_speed


function create_projectile(	projectile_id, projectile_creator, projectile_faction, 
							projectile_hp, projectile_damage, projectile_speed,
							projectile_sprite_id, projectile_sprite_speed, projectile_sprite_colour,
							explosion_sprite_id, explosion_sprite_speed) {
	
	var bullet = instance_create_layer(x, y, "Instances", projectile_id);	
	with bullet {
		creator					= other.projectile_creator;		
		faction					= other.projectile_faction;
		projectile_hp			= other.projectile_hp;
		projectile_damage		= other.projectile_damage;
		projectile_speed		= other.projectile_speed;
		projectile_sprite_id	= other.projectile_sprite_id;
		projectile_sprite_speed	= other.projectile_sprite_speed;
		projectile_sprite_colour= other.projectile_sprite_colour;
		explosion_sprite_id		= other.explosion_sprite_id;
		explosion_sprite_speed	= other.explosion_sprite_speed;
		depth					= other.projectile_creator.depth + 1;
	}		
}