// Inherit the parent event
event_inherited();

//// Dynamic Enemy Attributes ///////////////////////////////////////////////////
//swarmer_childen = [];

//// Create swarmer drones.
//for (var i = 0; i < 5*health_points_max; ++i) {
//	var swarmer = instance_create_layer(x, y, "Instances", obj_swarmer_drone, {
//		creator			: id,
//		max_speed		: swarmer_speed,
//		max_force		: swarmer_rotation,
//		max_rot_force	: swarmer_rotation_max,
//		steer_radius	: swarmer_radius,
//		blend_colour	: swarmer_colour
//	});
//	array_push(swarmer_childen, swarmer.id);
//}