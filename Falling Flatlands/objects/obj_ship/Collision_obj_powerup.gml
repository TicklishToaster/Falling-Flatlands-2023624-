with(other) {
	var powerup_type = name;
	instance_destroy();
}

switch(powerup_type){
	case "Spread":
		// Spread Bullet
		ship_powerups.spread_shot = true;
		alarm[1] = 5000*room_speed;
		break;
		
	case "Scatter":
		// Scatter Bullet
		ship_powerups.scatter_shot = true;
		alarm[1] = 5000*room_speed;
		break;
		
	case "Rapid":
		// Rapid Bullet
		ship_powerups.rapid_shot = true;
		ship_attack_speed = 0.1;
		alarm[1] = 5000*room_speed;
		break;	

	case "Laser":
		// Laser Bullet
		ship_powerups.laser_shot = true;
		alarm[1] = 5000*room_speed;
		break;
}

powerup_timer = 8;
alarm[2] = room_speed * 0.1;
audio_play_sound(UI__FTL____Upgrade, 10, false);