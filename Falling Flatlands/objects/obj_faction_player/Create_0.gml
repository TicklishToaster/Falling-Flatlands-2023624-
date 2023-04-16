// Inherit the parent event
event_inherited();

// Static Ship Attributes /////////////////////////////////////////////////////
// Faction
faction = factions.player;

// Shield
shield_enabled		= false;
shield_recharge		= false;
shield_surface		= -1;
shield_sprite		= noone;

// Attack
attack_cooldown		= false;

// I-Frames
iframes_enabled		= false;
iframes_blink		= 0;

// Collision Cooldown
collision_damage_cooldown	= false;
collision_damage_timer_max	= 2.0;
collision_damage_timer		= collision_damage_timer_max;

// Shield Cooldown
shield_effect_cooldown	= false;
shield_effect_timer_max	= 0.5;
shield_effect_timer		= shield_effect_timer_max;

// FX
exhaust_counter		= 0;


// Unique Condintional Attributes /////////////////////////////////////////////
ship_artemis		= false;
