/// @description Apply Damage

// Inherit the parent event
event_inherited();

// Play audio clip for taking damage.
if (health_points >= 1) {
	audio_play_sound(choose(
	SFX__FTL____Energy_Shot_Impact__A_,
	SFX__FTL____Energy_Shot_Impact__B_,
	SFX__FTL____Energy_Shot_Impact__C_), 
	10, false);	
}

// Play special audio clip if health is critical.
if (health_points == 1) {
	audio_play_sound(SFX__ITB____Shield_Down, 10, false);
}
