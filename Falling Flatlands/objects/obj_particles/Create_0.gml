particle_system = part_system_create();
part_system_depth(particle_system, +100);

//Exhaust
part_type_ship_exhaust = part_type_create();
part_type_sprite(	part_type_ship_exhaust, spr_exhaust, false, false, false);
part_type_size(		part_type_ship_exhaust, 0.4, 0.4, 0.05, 0);
part_type_colour3(	part_type_ship_exhaust, c_white, c_fuchsia, c_purple);
part_type_alpha3(	part_type_ship_exhaust, 1, 1, 0);
part_type_life(		part_type_ship_exhaust, 20, 20);

part_type_ship_exhaust_large = part_type_create();
part_type_sprite(	part_type_ship_exhaust_large, spr_exhaust, false, false, false);
part_type_size(		part_type_ship_exhaust_large, 0.8, 0.8, 0.05, 0);
part_type_colour3(	part_type_ship_exhaust_large, c_white, c_fuchsia, c_purple);
part_type_alpha3(	part_type_ship_exhaust_large, 1, 1, 0);
part_type_life(		part_type_ship_exhaust_large, 20, 20);

part_type_enemy_exhaust = part_type_create();
part_type_sprite(	part_type_enemy_exhaust, spr_exhaust, false, false, false);
part_type_size(		part_type_enemy_exhaust, 0.4, 0.4, 0.05, 0);
part_type_colour3(	part_type_enemy_exhaust, c_yellow, c_orange, c_red);
part_type_alpha3(	part_type_enemy_exhaust, 1, 1, 0);
part_type_life(		part_type_enemy_exhaust, 20, 20);


//Debris
part_type_ship_debris = part_type_create();
part_type_sprite(		part_type_ship_debris, spr_ship_debris, false, false, true);
part_type_life(			part_type_ship_debris, 60, 80);
part_type_size(			part_type_ship_debris, 0.5, 1.0, 0, 0);
part_type_speed(		part_type_ship_debris, 3, 4, -0.05, 0);
part_type_direction(	part_type_ship_debris, 0, 359, 0, false);
part_type_orientation(	part_type_ship_debris, 0, 359, 1, false, false);
part_type_alpha3(		part_type_ship_debris, 0.6, 0.6, 0);

part_type_asteroid_debris = part_type_create();
part_type_sprite(		part_type_asteroid_debris, spr_asteroid_debris, false, false, true);
part_type_life(			part_type_asteroid_debris, 60, 80);
part_type_speed(		part_type_asteroid_debris, 2, 2.5, -0.02, 0);
part_type_direction(	part_type_asteroid_debris, 0, 359, 0, false);
part_type_orientation(	part_type_asteroid_debris, 0, 359, 1, false, false);
part_type_alpha3(		part_type_asteroid_debris, 0.8, 0.8, 0);
