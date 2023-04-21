// Inherit the parent event
event_inherited();


// Static Enemy Attributes ////////////////////////////////////////////////////
// Combat
attack_cooldown		= true;
engagement_range	= 280;
impact_counter		= 0;

// Movement
proximity_radius	= 96;

// FX
exhaust_counter		= 0;

// Drone
swarmer_coefficient = 3;


// Dynamic Enemy Attributes ///////////////////////////////////////////////////
swarmer_childen = [];

// Create swarmer drones.
for (var i = 0; i < swarmer_coefficient*health_points_max; ++i) {
	var swarmer = instance_create_layer(x, y, "Instances", obj_swarmer_drone, {
		creator			: id,
		max_speed		: swarmer_speed,
		max_force		: swarmer_rotation,
		max_rot_force	: swarmer_rotation_max,
		steer_radius	: swarmer_radius,
		swarmer_blend	: enemy_colour_blend
	});
	array_push(swarmer_childen, swarmer.id);
}