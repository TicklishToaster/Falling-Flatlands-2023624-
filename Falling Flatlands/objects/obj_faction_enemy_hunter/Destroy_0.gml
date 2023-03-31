// Create Debris
var xx = x;
var yy = y;
var ib = image_blend;
with(obj_particles){
	part_particles_create_colour(particle_system, xx, yy, part_type_ship_debris, ib, 10);
}

// Assign Points
score += destroy_score;

// Toggle Camera Shake
uc_shake(1, 0.1);

// Play destroy audio clip.
audio_play_sound(SFX__FTL____Enemy_Destroy__C_, 10, false);