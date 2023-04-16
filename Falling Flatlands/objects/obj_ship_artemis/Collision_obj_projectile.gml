// Inherit the parent event
event_inherited();


// If the colliding projectile is hostile to own faction.
if (other.faction != faction) {	
	// Nullify damage/knockback if projectile has already collided.
	if (other == last_collider) {
		// Exit event.
		exit;
	}
	
	// Set projectile as the most recent collider.
	last_collider = other;	
	
	// Set variables in the newly registered projectile.
	other.collider = self;
	other.projectile_hp -= 1;
	with (other) {event_user(0);}	
	
	// Nullify damage/knockback if speed is greater than the default maximum.
	if (speed > max_speed_default) {
		// Set projectile health points to 0 to prevent piercing through hull.
		other.projectile_hp = 0;
		
		// Play shield impact audio.
		audio_play_sound(choose(
		SFX__FTL____Shield_Hit_Ion__A_,
		SFX__FTL____Shield_Hit_Ion__B_,
		SFX__FTL____Shield_Hit_Ion__C_), 
		10, false);
	
		// Exit event.
		exit;
	}
	
	// Nullify damage and knockback if i-frames are enabled.
	if (iframes_enabled) {
		// Play projectile miss audio.
		audio_play_sound(SFX__FTL____Projectile_Miss, 10, false);
		
		// Exit event.
		exit;		
	}
	
	// Apply damage and knockback.
	take_damage = other.projectile_damage;
	// Call damage event.
	event_user(0);
		
	// Call knockback event.
	event_user(1);
}