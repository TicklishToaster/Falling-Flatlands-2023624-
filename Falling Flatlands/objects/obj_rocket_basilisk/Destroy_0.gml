/// @description Splash Damage

if (rocket_type = 3) {
	for (var i = 0; i < instance_number(obj_faction_enemy); i += 1) {
		var target_iteration = instance_find(obj_faction_enemy, i);
		if (collision_circle(x, y, 128, target_iteration, true, false)) {
			with (instance_find(obj_faction_enemy, i)) {
				health_points -= 1;
			}
		}
	}
}


