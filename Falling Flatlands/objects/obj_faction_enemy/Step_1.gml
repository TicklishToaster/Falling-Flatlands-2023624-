// Countdown collision damage cooldown.
if (collision_damage_cooldown) {
	collision_damage_timer = clamp(collision_damage_timer - (room_speed / 60 / 60), 0, collision_damage_timer_max);
	if (collision_damage_timer) <= 0 {
		collision_damage_cooldown	= false;
		collision_damage_timer		= collision_damage_timer_max;
	}
}