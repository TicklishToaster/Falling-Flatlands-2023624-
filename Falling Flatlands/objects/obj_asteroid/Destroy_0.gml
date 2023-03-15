// Spawn Powerup (1/10 Chance)
if irandom_range(1, 10) == 1 {
	instance_create_layer(x, y, "Instances", obj_powerup)
}

var xx = x;
var yy = y;

// Split into smaller asteroids.
if asteroid_size == "large" {
	// Create New Asteroids
	repeat(2){
		var new_asteroid = instance_create_layer(x, y, "Instances", obj_asteroid);
		new_asteroid.sprite_index = choose(spr_asteroid_med_0, spr_asteroid_med_1, spr_asteroid_med_2);
		new_asteroid.asteroid_size = "med";
	}
	// Create Debris
	with(obj_particles){part_particles_create(particle_system, xx, yy, part_type_asteroid_debris, 12);}
	// Shake screen if asteroid is in view.	
	if point_in_rectangle(xx, yy, global.cameraX-128, global.cameraY-128, 
	global.cameraX+global.cameraWidth+128, global.cameraY+global.cameraHeight+128){global.cameraShake = 4;}
}

else if asteroid_size == "med" {
	// Create New Asteroids	
	repeat(2)
	{
		var new_asteroid = instance_create_layer(x, y, "Instances", obj_asteroid);
		new_asteroid.sprite_index = choose(spr_asteroid_small_0, spr_asteroid_small_1, spr_asteroid_small_2);
		new_asteroid.asteroid_size = "small";
	}
	// Create Debris
	with(obj_particles){part_particles_create(particle_system, xx, yy, part_type_asteroid_debris, 8);}
	// Shake screen if asteroid is in view.
	if point_in_rectangle(xx, yy, global.cameraX-128, global.cameraY-128, 
	global.cameraX+global.cameraWidth+128, global.cameraY+global.cameraHeight+128){global.cameraShake = 2;}	
}

else if asteroid_size == "small" {
	// Create Debris
	with(obj_particles){
		part_particles_create(particle_system, xx, yy, part_type_asteroid_debris, 4);
	}
	// Shake screen if asteroid is in view.	
	if point_in_rectangle(xx, yy, global.cameraX-128, global.cameraY-128, 
	global.cameraX+global.cameraWidth+128, global.cameraY+global.cameraHeight+128){global.cameraShake = 1;}	
}

if point_in_rectangle(xx, yy, global.cameraX-128, global.cameraY-128, 
global.cameraX+global.cameraWidth+128, global.cameraY+global.cameraHeight+128){
	audio_play_sound(choose(
	SFX__FTL____Energy_Shot_Impact__A_,
	SFX__FTL____Energy_Shot_Impact__B_,
	SFX__FTL____Energy_Shot_Impact__C_
	), 10, false);
}

// Score points only if the player destroyed the asteroid.
if fact_exec == factions.ally {
	score += 10;
}