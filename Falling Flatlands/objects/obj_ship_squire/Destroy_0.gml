
// Create Ship Debris
var xx = x;
var yy = y;
var ib = image_blend;
with(obj_particles){
	part_particles_create_colour(particle_system, xx, yy, part_type_ship_debris, ib, 10);
}

// Play Destroy Audio
audio_play_sound(SFX__FTL____Enemy_Destroy__A_, 10, false);

// Destroy ship and grapple objects.
instance_destroy();
//if instance_exists(obj_grapple_hook) instance_destroy(obj_grapple_hook);
// DO SOMETHING?
instance_destroy(obj_faction);

// Decrease Lives
lives -= 1;

// Room Reset Call
with obj_game {
	alarm[1] = room_speed * 3
}