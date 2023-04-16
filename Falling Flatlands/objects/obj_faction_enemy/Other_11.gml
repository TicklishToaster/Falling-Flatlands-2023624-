/// @description Apply Knockback
var collision_id = collision_detection_data[array_length(collision_detection_data)-1];
var collision_object = collision_detection_data[array_length(collision_detection_data)-1][6];
var collision_target = self;

// Exit if either the collision object or collision target cannot knockback.
if (collision_object.knockback_send == 0.00 || collision_target.knockback_take = 0.00) {
	exit;
}

// Apply knockback.
motion_set(collision_id[2]-180, max(speed/2, collision_object.knockback_send));