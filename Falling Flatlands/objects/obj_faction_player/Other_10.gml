/// @description Apply Damage
var collision_id = collision_detection_data[array_length(collision_detection_data)-1];

// Deduct damage number from health points.
health_points -= take_damage;
		
// Enable I-Frames.
iframes_enabled = true;
		
// Set collision damage cooldown to true to prevent damage on every frame.
collision_damage_cooldown = true;

// Reset take damage.
take_damage = 0;

// Play audio clip for taking damage.
if (health_points > 1) {
	audio_play_sound(SFX__ITB____Ship_Damage, 10, false);
}

// Play special audio clip if health is critical.
if (health_points == 1) {
	audio_play_sound(UI__ITB____Critical_Health, 10, false);
}
		
// Trigger hit camera function.
uc_hit(collision_id[2]-180, 1, 0.1);

// Trigger flash camera function.
uc_flash(c_red, [0.4, 0.1], 0.2);
