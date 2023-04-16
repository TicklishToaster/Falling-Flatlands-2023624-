// Inherit the parent event
event_inherited();

// Exit if collision damage is on cooldown.
if (collision_damage_cooldown) {
	exit;
}

// If the colliding projectile is hostile to own faction.
if (other.faction != faction) {
	// Set collision damage cooldown to true to prevent damage on every frame.
	collision_damage_cooldown = true;
	
	// Apply collision damage/knockback to self if the colliding object is a boosting enemy charger.
	if (object_is_ancestor(other.object_index, obj_faction_enemy_charger)) {
		if (other.boosting == true) {
			// Apply damage and knockback to self.
			// Call damage event.
			take_damage = 1;
			event_user(0);
			
			// Call knockback event.
			event_user(1);
		}
	}
	
	// Apply collision damage to self if the colliding object is a swarmer.
	if (object_is_ancestor(other.object_index, obj_faction_enemy_swarmer)) {
		if (speed <= max_speed_default) {
			// Apply damage and knockback to self.
			// Call damage event.
			take_damage = 1;
			event_user(0);
			
			// Call knockback event.
			event_user(1);	
		}
	}
	
	// Apply increased damage to the colliding object based on the speed of the Artemis.
	if (speed > max_speed_boosted - 1) {
		other.health_points -= 5;
	}
	else if (speed > max_speed_default * 1.5) {
		other.health_points -= 3;
	}
	else if (speed > max_speed_default) {
		other.health_points -= 2;
	}
	else if (speed == max_speed_default) {
		other.health_points -= 1;
	}
	else if (speed <= max_speed_default) {
		other.health_points -= 0;
	}
	
	// Check if collision will destroy the enemy.
	if (other.health_points <= 0 || other.health_points-1 <= 0) {
		// Heal 1 hit point if current health points are below the maximum.
		if (health_points < health_points_max) {
			health_points = clamp(health_points + 1, 0, health_points_max);
		
			// Play audio clip for restoring health.
			audio_play_sound(UI__ITB____Heal_Health, 10, false);
			
			// Trigger hit and flash camera functions.
			uc_flash(c_fuchsia, [0.4, 0.1], 0.2);			
		}
	}
	
	// Apply knockback if colliding object is stationary.
	if (other.knockback_take == 0) {
		// Call knockback event.
		event_user(1);
	}
}