// Inherit the parent event
event_inherited();

// Countdown teleport cooldown timer.
if (teleport_cooldown) {
	teleport_cooldown_timer = clamp(teleport_cooldown_timer - (room_speed / 60 / 60), 0, teleport_cooldown_timer_max);
	if (teleport_cooldown_timer) <= 0 {
		teleport_cooldown = false;
		teleport_cooldown_timer = teleport_cooldown_timer_max;
		teleport_fired = false;
		//with(obj_particles) {
		//	part_type_alpha1(part_type_sentry_ring, 0);
		//}
		
		attack_cooldown = true;
		attack_cooldown_timer = attack_cooldown_timer_max;
	}
}


// Countdown attack cooldown.
if (attack_cooldown && !teleport_fired) {
	attack_cooldown_timer = clamp(attack_cooldown_timer - (room_speed / 60 / 60), 0, attack_cooldown_timer_max);
	if (attack_cooldown_timer) <= 0 {
		attack_cooldown = false;
		attack_cooldown_timer = attack_cooldown_timer_max;		
	}
}
