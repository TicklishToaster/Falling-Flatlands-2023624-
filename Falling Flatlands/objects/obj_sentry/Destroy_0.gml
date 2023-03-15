// Create Debris
var xx = x;
var yy = y;
var ib = image_blend;
with(obj_particles){
	part_particles_create_colour(particle_system, xx, yy, part_type_ship_debris, ib, 10);
}

// Assign Points
switch(object_index){
	case obj_raider: 
		score += 15; 
		break;
	case obj_hunter: 
		score += 30; 
		break;
	case obj_sentry: 
		score += 50; 
		break;
}

// Toggle Camera Shake
obj_camera.camera_shake = 4;
audio_play_sound(SFX__FTL____Enemy_Destroy__C_, 10, false);