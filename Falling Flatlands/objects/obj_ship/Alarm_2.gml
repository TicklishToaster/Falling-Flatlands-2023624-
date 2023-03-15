/// @description Powerup Timer

// When called this function will continue to call itself until powerup_timer is 0.
powerup_timer -= 0.1;
if powerup_timer > 0 {
	alarm[2] = room_speed * 0.1;
} else {
	ship_powerups.spread_shot	= false;
	ship_powerups.scatter_shot	= false;
	ship_powerups.rapid_shot	= false;
	ship_powerups.laser_shot	= false;
}