/// @description Drop Powerup

var chance = irandom_range(1, 20); // 10

if (chance == 1) {
	var powerup = instance_create_layer(x, y, "Instances", obj_powerup);
	if (instance_exists(obj_ship_squire)) {
		with (powerup) {
			var type = choose(1, 2, 3);
			powerup_type = 1 + type;
		}
	}
}

if (obj_level.condition_win_enemy == true) {
	obj_level.condition_enemy_number += 1;
}