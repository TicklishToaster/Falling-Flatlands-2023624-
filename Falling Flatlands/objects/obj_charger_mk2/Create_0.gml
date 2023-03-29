// Inherit the parent event
event_inherited();


// Enemy Attributes ///////////////////////////////////////////////////////////
// Health
health_points_max	= 1;
health_points		= health_points_max;

// Movement
max_speed			= 2;	//2
max_speed_default	= max_speed;
max_speed_boosted	= max_speed*10;
acceleration		= 0.05; //0.05
rotation_speed		= 0.8;	//1
knockback_modifier	= 1;	//1
proximity_radius	= 96;
exhaust_counter		= 0;

// Combat
attack_cooldown				= true;
attack_cooldown_timer_max	= 4.0;
attack_cooldown_timer		= attack_cooldown_timer_max;
engagement_range			= 256;

// Charge
charge_enable	= false;
charge_complete = false;
boosting		= false;
boost_location_x= 0;
boost_location_y= 0;
boost_distance	= 480; // 480
charge_timer_max= 2.0;
charge_timer	= charge_timer_max;

// Other Data
destroy_score = 10;