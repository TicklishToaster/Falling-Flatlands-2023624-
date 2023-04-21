// Inherit the parent event
event_inherited();

// Assign Points
score += destroy_score;

// Toggle Camera Shake
uc_shake(1, 0.1);

// Play destroy audio clip.
audio_stop_sound(SFX__FTL____Enemy_Destroy__B_);
audio_play_sound(SFX__FTL____Enemy_Destroy__B_, 10, false);

// Destroy all remaining swarmers.
for (var i = 0; i < swarmer_coefficient*health_points_max; ++i) {
	if (instance_exists(array_get(swarmer_childen, i))) {
		// Create swarmer debris.		
		with(obj_particles){	
			part_type_sprite(		part_type_swarmer_debris, spr_enemy_swarmer, false, false, true);
			part_type_life(			part_type_swarmer_debris, 60, 80);
			part_type_size(			part_type_swarmer_debris, 0.5, 1.0, 0, 0);
			part_type_speed(		part_type_swarmer_debris, 3, 4, -0.05, 0);
			part_type_direction(	part_type_swarmer_debris, 0, 359, 0, false);
			part_type_orientation(	part_type_swarmer_debris, 0, 359, 1, false, false);
			part_type_alpha3(		part_type_swarmer_debris, 0.6, 0.6, 0);			
			part_particles_create_color(particle_system, 
				array_get(other.swarmer_childen, i).x, array_get(other.swarmer_childen, i).y, 
				part_type_swarmer_debris, other.swarmer_colour, 2);
		}
		instance_destroy(array_get(swarmer_childen, i));
	}
}
