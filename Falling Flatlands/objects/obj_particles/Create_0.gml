particle_system = part_system_create();
part_system_depth(particle_system, +100);

// Ship Exhaust
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
part_type_size(		part_type_enemy_exhaust, 0.8, 0.8, 0.05, 0);
part_type_colour3(	part_type_enemy_exhaust, c_yellow, c_orange, c_red);
part_type_alpha3(	part_type_enemy_exhaust, 1, 1, 0);
part_type_life(		part_type_enemy_exhaust, 20, 20);

part_type_sentry_exhaust = part_type_create();
part_type_shape(	part_type_sentry_exhaust, pt_shape_circle);
part_type_size(		part_type_sentry_exhaust, 1.0, 1.0, 0.03, 0);
part_type_colour3(	part_type_sentry_exhaust, c_red, c_red, c_red);
part_type_alpha3(	part_type_sentry_exhaust, 1, 1, 0);
part_type_life(		part_type_sentry_exhaust, 20, 20);

part_type_sentry_ring = part_type_create();
part_type_shape(	part_type_sentry_ring, pt_shape_circle);
part_type_size(		part_type_sentry_ring, 1.0, 1.0, 0.03, 0);
part_type_colour3(	part_type_sentry_ring, c_red, c_red, c_red);
part_type_alpha3(	part_type_sentry_ring, 1, 1, 0);
part_type_life(		part_type_sentry_ring, 20, 20);

part_type_swarmer_image = part_type_create();
part_type_alpha2(		part_type_swarmer_image, 1, 0);
part_type_life(			part_type_swarmer_image, 20, 20);		
part_type_orientation(	part_type_swarmer_image, 0, 0, 0, 0, 0);
part_type_sprite(		part_type_swarmer_image, spr_enemy_swarmer, false, false, false);


// Ship Debris
part_type_swarmer_debris = part_type_create();

part_type_ship_debris = part_type_create();
part_type_sprite(		part_type_ship_debris, spr_ship_debris, false, false, true);
part_type_life(			part_type_ship_debris, 60, 80);
part_type_size(			part_type_ship_debris, 0.5, 1.0, 0, 0);
part_type_speed(		part_type_ship_debris, 3, 4, -0.05, 0);
part_type_direction(	part_type_ship_debris, 0, 359, 0, false);
part_type_orientation(	part_type_ship_debris, 0, 359, 1, false, false);
part_type_alpha3(		part_type_ship_debris, 0.6, 0.6, 0);

//part_type_asteroid_debris = part_type_create();
//part_type_sprite(		part_type_asteroid_debris, spr_asteroid_debris, false, false, true);
//part_type_life(			part_type_asteroid_debris, 60, 80);
//part_type_speed(		part_type_asteroid_debris, 2, 2.5, -0.02, 0);
//part_type_direction(	part_type_asteroid_debris, 0, 359, 0, false);
//part_type_orientation(	part_type_asteroid_debris, 0, 359, 1, false, false);
//part_type_alpha3(		part_type_asteroid_debris, 0.8, 0.8, 0);


// Ship Charge
part_type_charge_artemis = part_type_create();
part_type_shape(	part_type_charge_artemis, pt_shape_line);
part_type_life(		part_type_charge_artemis, 10, 60);
part_type_size(		part_type_charge_artemis, 0.1, 0.3, -0.02, 0);
part_type_speed(	part_type_charge_artemis, 1, 3, 0.01, 0);
part_type_colour1(	part_type_charge_artemis, make_colour_rgb(175, 150, 200));

// Charger Charge
part_type_charge_charger = part_type_create();
//part_type_shape(	part_type_charge_charger, pt_shape_line);
////part_type_life(		part_type_charge_charger, 10, 60);
//part_type_life(		part_type_charge_charger, 3000, 3000);
////part_type_size(		part_type_charge_charger, 0.1, 0.3, -0.02, 0);
//part_type_size(		part_type_charge_charger, 0.1, 0.3, 0, 0);
//part_type_speed(	part_type_charge_charger, 1, 3, 0.01, 0);
//part_type_colour1(	part_type_charge_charger, c_red);

//part_type_charge_artemis = part_type_create();
//part_type_shape(	part_type_charge_artemis, pt_shape_line);
//part_type_life(		part_type_charge_artemis, 10, 60);
//part_type_size(		part_type_charge_artemis, 0.1, 0.3, -0.02, 0);
//part_type_speed(	part_type_charge_artemis, 1, 3, 0.01, 0);
//part_type_colour1(	part_type_charge_artemis, make_colour_rgb(175, 150, 200));




//part_type_charge	= part_type_create();
//part_type_shape(	part_type_charge, pt_shape_disk);
//part_type_speed(	part_type_charge, 5, 10, 0.1, 0);
//part_type_colour1(	part_type_charge, c_red);
//part_type_life(		part_type_charge, 10, 10);
//part_type_size(		part_type_charge, 0.1, 0.3, -0.02, 0);
