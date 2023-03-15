event_inherited()

x = room_width/2
y = room_height/2

ship_hp = 3;
ship_iframes = false;

ship_max_speed = 10;
exhaust_counter = 0;

ship_attack_speed = 0.5;
ship_attack_cooldown = false;
bullet_spd = 8;
orbitor_rot = 0;

ship_shield_enabled = false;
ship_shield_power = 10;

ship_powerups = 
{
	spread_shot		: false,
	scatter_shot	: false,
	rapid_shot		: false,		
	laser_shot		: false
}

powerup_timer = 0;

// Test
//ship_powerups.ship_shield = true; 
//ship_shield_enabled = true;
//powerup_timer = 8;
