// Inherit the parent event
event_inherited();


// Dynamic Ship Attributes ////////////////////////////////////////////////////
// Health
health_points			= health_points_max;

// Shield
shield_sprite			= noone;
shield_points			= shield_points_max;
shield_enabled_timer	= shield_enabled_timer_max;
shield_recharge_timer	= shield_recharge_timer_max;

// Attack
attack_cooldown_timer	= attack_cooldown_timer_max;

// Movement
//max_speed_current		= 10;	// 6
max_speed_default		= max_speed;
max_speed_boosted		= max_speed*2;
//acceleration			= 0.10;	// 0.05
rotation_speed_default	= rotation_speed;
rotation_speed_boosted	= rotation_speed/(rotation_speed*2);

// I-Frames
iframes_timer			= iframes_timer_max;

// Charge
boost_mode				= false;
booster_charge_enable	= false;
booster_charge_complete	= false;
booster_charge_timer	= 0;
charge_surface			= -1;


// Unique Condintional Attributes /////////////////////////////////////////////
ship_artemis = true;
