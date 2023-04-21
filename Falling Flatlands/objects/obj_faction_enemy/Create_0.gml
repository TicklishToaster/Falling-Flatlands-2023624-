// Inherit the parent event
event_inherited();

faction = factions.enemy;
projectile_collisions = [noone];

image_blend = c_red;
if (instance_exists(obj_faction_player)) {
	depth = obj_faction_player.depth - 1;
}

//image_speed = 0;


//exhaust_counter = 0;

collision_damage_cooldown	= false;
collision_damage_timer_max	= 2.0;
collision_damage_timer		= collision_damage_timer_max;
