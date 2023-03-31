/// @description Spawn Projectile Explosion
if (collider != noone && variable_instance_exists(collider, "collision_detection_data")) {
	var create_x = collider.collision_detection_data[array_length(collider.collision_detection_data)-1][0];
	var create_y = collider.collision_detection_data[array_length(collider.collision_detection_data)-1][1];
	with (instance_create_layer(create_x, create_y, "Instances", obj_explosion)) {
		collider_parent			= other.collider;
		collision_id			= array_length(other.collider.collision_detection_data)-1;
		explosion_sprite_id		= other.explosion_sprite_id;
		explosion_sprite_speed	= other.explosion_sprite_speed;
		explosion_sprite_colour	= other.projectile_sprite_colour;
		sprite_index			= explosion_sprite_id;
	};
}