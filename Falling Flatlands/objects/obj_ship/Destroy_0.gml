lives -= 1;

// Call room reset.
with obj_game {
	alarm[1] = room_speed * 3
}

// Destroy ship and grapple objects.
instance_destroy();
if instance_exists(obj_grapple_hook) instance_destroy(obj_grapple_hook);

// Create Debris
var xx = x;
var yy = y;
var ib = image_blend;
with(obj_particles){
	part_particles_create_colour(particle_system, xx, yy, part_type_ship_debris, ib, 10);
}

audio_play_sound(SFX__FTL____Enemy_Destroy__A_, 10, false);

instance_destroy(obj_faction);