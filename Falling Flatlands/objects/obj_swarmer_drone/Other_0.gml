///////// @description OLD
//////// You can write your code in this editor

////////// Inherit the parent event
////////event_inherited();

////////// Draw ship sprite(s).
////////for (var i1 = -1; i1 < 2; ++i1) {
////////    // code here
////////	for (var i2 = -1; i2 < 2; ++i2) {
////////	    draw_sprite_ext(spr_enemy_swarmer, 1, x+32*i1, y+32*i2, 1, 1, image_angle, c_red, 1);
////////	}
////////}

//////////draw_sprite_ext(spr_enemy_swarmer, 0, x, y, 1, 1, image_angle, c_red, 1);
//////////draw_sprite_ext(spr_enemy_swarmer, 1, x-32, y-32, 1, 1, image_angle, c_red, 1);
//////////draw_sprite_ext(spr_enemy_swarmer, 2, x-32, y+32, 1, 1, image_angle, c_red, 1);
//////////draw_sprite_ext(spr_enemy_swarmer, 3, x+32, y-32, 1, 1, image_angle, c_red, 1);
//////////draw_sprite_ext(spr_enemy_swarmer, 4, x+32, y+32, 1, 1, image_angle, c_red, 1);
//////////draw_sprite_ext(spr_enemy_swarmer, 5, x+32, y+32, 1, 1, image_angle, c_red, 1);
//////////draw_sprite_ext(spr_enemy_swarmer, 6, x+32, y+32, 1, 1, image_angle, c_red, 1);
//////////draw_sprite_ext(spr_enemy_swarmer, 6, x+32, y+32, 1, 1, image_angle, c_red, 1);


//////draw_sprite_ext(spr_enemy_swarmer, image_index, x, y, 1, 1, image_angle, c_red, 1);


//////// Particle FX
////////if (speed > 0) {
//////var exhaust_limit = 24;
//////var exhaust_limit = 8;
//////exhaust_counter++;
//////if (exhaust_counter >= exhaust_limit) {
//////	exhaust_counter = 0;
//////	with(obj_particles){
//////		part_type_colour2(		part_type_swarmer_image, c_red, c_red);
//////		part_type_alpha2(		part_type_swarmer_image, 1, 0);
//////		part_type_life(			part_type_swarmer_image, 20, 20);		
//////		part_type_orientation(	part_type_swarmer_image, other.image_angle, other.image_angle, 0, 0, 0);
//////		part_type_sprite(		part_type_swarmer_image, spr_enemy_swarmer, false, false, false);
//////		part_particles_create(	particle_system, other.x, other.y, part_type_swarmer_image, 1);
//////	}
//////}
////////}

////// Inherit the parent event
//////event_inherited();


////if (!instance_exists(obj_faction_player)) {
////	exit;
////}

/////// @description  Step Behaviour Usage

////// reset steering
////steering = vect2(0,0);

//////## Steering Behaviours go below here ##//

////// Add like this. (First one doesn't need the vect_add)
//////steering = vect_add(steering, sb_#behaviour#(argument,stuff,blah));
//////steering = vect_add(steering, sb_seek(obj_faction_player.x, obj_faction_player.y, 1));
//////with(obj_faction_player) {
//////	// reset steering
//////	steering = vect2(0,0);	
	
//////	//Limit steering by max_force
//////	steering = vect_truncate(steering, rotation_speed); 

//////	// Limit velocity to max_speed
//////	velocity = vect_truncate(vect_add(velocity, steering),max_speed); 

//////	//Add velocity to position
//////	position = vect_add(position, velocity);	
//////}

//////steering = vect_add(steering, sb_pursuit(obj_faction_player, 1));


//////steering = vect_add(steering, sb_seek(obj_faction_player.x, obj_faction_player.y, 1));
//////steering = vect_add(steering, sb_seek(mouse_x, mouse_y, 1));
//////steering = vect_add(steering, sb_seek_arrive(mouse_x,mouse_y,256,1));
//////steering = vect_add(steering, sb_wander(128, 128, 90, 1));
//////steering = vect_add(steering, sb_flee(mouse_x,mouse_y,1));
//////steering = vect_add(steering, sb_pursuit(obj_master_drone,1));
//////steering = vect_add(steering, sb_evade(obj_master_drone,1));
//////steering = vect_add(steering, sb_path_loop(my_path,30,my_path_dir,1));

//////steering = vect_add(steering, sb_alignment(	obj_faction_enemy_swarmer, 128, 1));
//////steering = vect_add(steering, sb_separation(obj_faction_enemy_swarmer, 32,  4));
//////steering = vect_add(steering, sb_cohesion(	obj_faction_enemy_swarmer, 128, 2));

//////steering = vect_add(steering, sb_avoid_collision(obj_obstacle,80,30,1));

//////steering = vect_add(steering, sb_seek(obj_faction_player.x, obj_faction_player.y, 1));
//////steering = vect_add(steering, sb_seek_slow(obj_faction_player.x, obj_faction_player.y, 1));

//////steering = vect_add(steering, sb_wander(128, 64, 90, 3));
////////steering = vect_add(steering, sb_wander(128, 128, 90, 3));
//////steering = vect_add(steering, sb_alignment(	obj_faction_enemy_swarmer, 128, 2));
////////steering = vect_add(steering, sb_alignment(	obj_faction_enemy_swarmer, 128, 2));
//////steering = vect_add(steering, sb_separation(obj_faction_enemy_swarmer, 64, 4));
////////steering = vect_add(steering, sb_separation(obj_faction_enemy_swarmer, 64, 3));
//////steering = vect_add(steering, sb_cohesion(	obj_faction_enemy_swarmer, 192, 3));
////////steering = vect_add(steering, sb_cohesion(	obj_faction_enemy_swarmer, 184, 4));

////var target_dist = point_distance(creator.x, creator.y, obj_faction_player.x, obj_faction_player.y)/2;
////var target_x = creator.x + lengthdir_x(32, creator.image_angle);
////var target_y = creator.y + lengthdir_y(32, creator.image_angle);
////var target_x = creator.x + lengthdir_x(creator.speed*16, creator.image_angle);
////var target_y = creator.y + lengthdir_y(creator.speed*16, creator.image_angle);
//////var target_x = creator.x + lengthdir_x(target_dist, creator.image_angle);
//////var target_y = creator.y + lengthdir_y(target_dist, creator.image_angle);

//////steering = vect_add(steering, sb_wander(128, wander, 90, 3));
//////steering = vect_add(steering, sb_alignment(	obj_faction_enemy_swarmer, alignment,	2));
//////steering = vect_add(steering, sb_separation(obj_faction_enemy_swarmer, separation,	4));
//////steering = vect_add(steering, sb_cohesion(	obj_faction_enemy_swarmer, cohesion,	3));

////wander		= 64;
////alignment	= 128;
////separation	= 64;
////cohesion	= 192;

////wander		= 64;
////alignment	= 64;
////separation	= 64;
////cohesion	= 64;


////max_speed = creator.max_speed*3;
////max_force = 0.6; // How fast it turns
////max_rot_force = 4.0; // How fast it turns

////max_speed = creator.max_speed*2.5;
////max_force = 0.6; // How fast it turns
////max_rot_force = 4.0; // How fast it turns

////max_speed = 5;
////max_force = 0.6; // How fast it turns
////max_rot_force = 4.0; // How fast it turns

//////steering = vect_add(steering, sb_seek(target_x, target_y, 1));
//////steering = vect_add(steering, sb_seek_slow(target_x, target_y, 2));
//////steering = vect_add(steering, sb_seek_slow(target_x, target_y, 1));
//////steering = vect_add(steering, sb_seek_slow(target_x, target_y, irandom_range(1, 2)));
////steering = vect_add(steering, sb_seek_slow(target_x, target_y, irandom_range(1, 2)));
//////steering = vect_add(steering, sb_seek_slow(target_x, target_y, choose(1, 3)));
////steering = vect_add(steering, sb_seek_arrive(target_x, target_y, separation, 2));
//////steering = vect_add(steering, sb_seek_slow(target_x, target_y, 1));

//////steering = vect_add(steering, sb_wander(128/2, wander, 90, 3));
////steering = vect_add(steering, sb_wander(128/2, wander, irandom_range(90, 180), 3));

////steering = vect_add(steering, sb_alignment(	obj_swarmer_drone, alignment,	1));
////steering = vect_add(steering, sb_separation(obj_swarmer_drone, separation,	2));
//////steering = vect_add(steering, sb_cohesion(	obj_swarmer_drone, cohesion,	1));

//////steering = vect_add(steering, sb_alignment(	creator, alignment,		1));
//////steering = vect_add(steering, sb_separation(creator, separation,		4));
//////steering = vect_add(steering, sb_cohesion(	creator, cohesion,		3));

//////steering = vect_add(steering, sb_seek_slow(target_x, target_y, 1));

//////image_angle -= angle_difference(image_angle, vect_direction(velocity))*max_force / 8;


//////## Steering Behaviours go above here ##//


//////Limit steering by max_force
////steering = vect_truncate(steering, max_force); 

////// Limit velocity to max_speed
////velocity = vect_truncate(vect_add(velocity, steering),max_speed); 

//////Add velocity to position
////position = vect_add(position, velocity);

////////update xy
//////x = position[1];
//////y = position[2];

////var n = 64;
//////x = clamp(x, target_x - lengthdir_x(64, 0), target_x + lengthdir_x(64, 0));
//////y = clamp(y, target_y - lengthdir_y(64, 270), target_y + lengthdir_y(64, 270));
//////x = clamp(x, target_x - n, target_x + n);
//////y = clamp(y, target_y - n, target_y + n);

////////var dist = sqrt(target_x * target_x + target_y * target_y)
////////var scale = min(n, dist) / dist;
//////var dir = point_direction(target_x, target_y, position[1], position[2]);

//////position[1] = clamp(position[1], 
//////	target_x + lengthdir_x(n, dir), 
//////	target_x - lengthdir_x(n, dir));
//////position[2] = clamp(position[2], 
//////	target_y + lengthdir_y(n, dir), 
//////	target_y - lengthdir_y(n, dir));
	
////var distance = clamp(point_distance(position[1], position[2], target_x, target_y), 0, n);
////var offset_x = lengthdir_x(distance, point_direction(target_x, target_y, position[1], position[2]));
////var offset_y = lengthdir_y(distance, point_direction(target_x, target_y, position[1], position[2]));
////position[1] = target_x + offset_x;
////position[2] = target_y + offset_y;

	
//////position[1] = clamp(position[1], target_x - n, target_x + n);
//////position[2] = clamp(position[2], target_y - n, target_y + n);

//////update xy
////x = position[1];
////y = position[2];

////image_angle = vect_direction(velocity);

//////image_angle = lerp(image_angle, vect_direction(velocity), 0.0001);


//////// Determine the angle required to face the target ship.
//////var new_angle = point_direction(x, y, obj_faction_player.x, obj_faction_player.y);
	
//////// Calculate the closest angle required to face the target (clock-wise or anti clock-wise).
//////new_angle = angle_difference(new_angle, image_angle);

//////// Rotate ship towards new angle.
//////image_angle += clamp(new_angle, -rotation_speed, rotation_speed);

//// Inherit the parent event
//event_inherited();


//// Dynamic Enemy Attributes ///////////////////////////////////////////////////
//// Sprite
//image_index = irandom_range(0, 7);


///// @description  Setup Steering Behaviour Support
//image_xscale = 1;
//image_yscale = image_xscale;

//max_speed = creator.max_speed*2;
//exhaust_counter = 0;

////Steering behaviour stuff
//position = vect2(x,y); // will be used to update xy
//velocity = vect2(0,0);
//steering = vect2(0,0); // desired velocity

////max_speed = 4;
//max_force = 0.2; // How fast it turns
//max_force = 0.6; // How fast it turns
//max_rot_force = 0.7; // How fast it turns
//max_rot_force = 2.0; // How fast it turns
//max_rot_force = 4.0; // How fast it turns
////max_rot_force = 8.0; // How fast it turns

//////Steering behaviour stuff
////obj_faction_player.position = vect2(x,y); // will be used to update xy
////obj_faction_player.velocity = vect2(0,0);
////obj_faction_player.steering = vect2(0,0); // desired velocity

////// Only needed if the object will follow paths
////my_path = path_loop;
////my_path_point = irandom(path_get_number(my_path)-1); // Choose a random point on the path
////my_path_dir = 1; // 1 = forwards, -1 = backwards
