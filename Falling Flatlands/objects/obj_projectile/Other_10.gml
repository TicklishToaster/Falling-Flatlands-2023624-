/// @description Spawn Projectile Explosion
// If current object is not onscreen then exit this event and nullify the potentially expensive processes below.
if (!point_in_rectangle(x, y, Camera.border_x1, Camera.border_y1, Camera.border_x2, Camera.border_y2)) {
	exit;
}

if (variable_instance_exists(collider, "collision_detection_data") && array_length(collider.collision_detection_data) > 0) {
	var collision_id = collider.collision_detection_data[max(array_length(collider.collision_detection_data)-1, 0)];
	if (collider != noone) {
		var create_x = collision_id[0];
		var create_y = collision_id[1];		
		with (instance_create_layer(create_x, create_y, "Instances", obj_explosion)) {
			collider_parent			= other.collider;
			explosion_sprite_id		= other.explosion_sprite_id;
			//explosion_sprite_speed	= other.explosion_sprite_speed;
			explosion_sprite_colour	= other.projectile_sprite_colour;
			sprite_index			= explosion_sprite_id;
			
			x_pos				= collision_id[0];
			y_pos				= collision_id[1];
			impact_direction	= collision_id[2];
			impact_angle		= collision_id[3];
			impact_length		= collision_id[4];
		}
	}
}
