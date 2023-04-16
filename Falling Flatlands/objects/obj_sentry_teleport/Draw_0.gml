// Inherit the parent event
event_inherited();

var tele_timer = (teleport_cooldown_timer_max - teleport_cooldown_timer);
if (tele_timer == 0) {
	tele_timer = 1;
}

// Draw sentry hull sprite.
draw_sprite_ext(
	spr_enemy_sentry_hull, (sprite_get_number(sprite_index)) - health_points, 
	//x, y, 1, 1, 0, c_red, 1);
	x, y, 1, 1, 0, c_red, 
	clamp(tele_timer, 0, 1));
	
// Draw sentry gun sprites.
for (var i = 0; i < array_length(gun_angles); i += 1) {
	draw_sprite_ext(spr_enemy_sentry_gun, 2, 
	//x, y, 1, 1, gun_angles[i], c_red, 1);
	x, y, 1, 1, gun_angles[i], c_red, 
	clamp(tele_timer, 0, 1));
}

// Draw sentry hull afterimage sprite.
draw_sprite_ext(
	spr_enemy_sentry_hull, (sprite_get_number(sprite_index)) - health_points, 
	previous_x, previous_y, 1, 1, 0, c_red, 
	clamp(1-tele_timer, 0, 1));
	
// Draw sentry gun afterimage sprites.
for (var i = 0; i < array_length(gun_angles_previous); i += 1) {
	draw_sprite_ext(spr_enemy_sentry_gun, 2, 
	previous_x, previous_y, 1, 1, gun_angles_previous[i], c_red, 
	clamp(1-tele_timer, 0, 1));
}


// Particle FX Attack Charge
if (teleport_ring) {
	teleport_ring = false
	var life = attack_cooldown_timer_max * room_speed * 2;
	var n = attack_cooldown_timer_max;
	var ring = n / life
	with(obj_particles) {
		part_type_shape(	part_type_sentry_ring, pt_shape_circle);
		part_type_size(		part_type_sentry_ring, n, n, -ring, 0);
		part_type_colour2(	part_type_sentry_ring, c_maroon, c_red);
		part_type_alpha2(	part_type_sentry_ring, 1, 1);
		part_type_life(		part_type_sentry_ring, life, life);
			
		part_particles_create(particle_system, other.x, other.y, part_type_sentry_ring, 1);			
	}
}

// Particle FX Teleport Charge
if (teleport_fired) {
	var exhaust_limit = (teleport_cooldown_timer_max-tele_timer) * teleport_cooldown_timer_max;
	exhaust_limit += teleport_cooldown_timer_max;
	var size = (tele_timer/teleport_cooldown_timer_max) * 2;
	
	exhaust_counter++;
	if (exhaust_counter >= exhaust_limit) {
		exhaust_counter = 0;
		with(obj_particles){
			part_type_shape(	part_type_sentry_exhaust, pt_shape_circle);
			part_type_size(		part_type_sentry_exhaust, 0.8, 0.8, 0.03*size, 0);
			part_type_colour2(	part_type_sentry_exhaust, c_red, c_maroon);
			part_type_alpha2(	part_type_sentry_exhaust, 1.0, 1.0);
			part_type_life(		part_type_sentry_exhaust, 20, 20);
			part_particles_create(particle_system, other.x, other.y, part_type_sentry_exhaust, 1);
		}
	}
}


//// DEBUG
//var border_x1 = uc_get_view_x() + sprite_width  / 2;
//var border_y1 = uc_get_view_y() + sprite_height / 2;
//var border_x2 = uc_get_view_x() - sprite_width  / 2 + Camera.camera_width;
//var border_y2 = uc_get_view_y() - sprite_height / 2 + Camera.camera_height;
//draw_rectangle(border_x1, border_y1, border_x2, border_y2, true)