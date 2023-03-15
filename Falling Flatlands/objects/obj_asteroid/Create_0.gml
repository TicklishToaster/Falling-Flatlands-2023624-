event_inherited();

asteroid_size = choose("small", "med", "large");
if asteroid_size == "small"{
	sprite_index = choose(spr_asteroid_small_0, spr_asteroid_small_1, spr_asteroid_small_2);
} else if asteroid_size == "med"{
	sprite_index = choose(spr_asteroid_med_0, spr_asteroid_med_1, spr_asteroid_med_2);
} else if asteroid_size == "large"{
	sprite_index = choose(spr_asteroid_large_0, spr_asteroid_large_1, spr_asteroid_large_2);
}

direction = irandom_range(0, 359);
image_angle = irandom_range(0, 359);
speed = 1;
fact_exec = factions.neutral
