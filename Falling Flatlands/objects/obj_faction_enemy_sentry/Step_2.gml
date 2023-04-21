// Inherit the parent event
event_inherited();

// Countdown attack cooldown.
if (attack_cooldown) {
	attack_cooldown_timer = clamp(attack_cooldown_timer - (room_speed / 60 / 60), 0, attack_cooldown_timer_max);
	if (attack_cooldown_timer) <= 0 {
		attack_cooldown = false;
		attack_cooldown_timer = attack_cooldown_timer_max;
	}
}

speed = 0;