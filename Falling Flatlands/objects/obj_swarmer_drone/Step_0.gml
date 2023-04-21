// Exit if either the creator or target exist.
if (!instance_exists(obj_faction_player) || !instance_exists(creator)) {
	exit;
}

// If current object is not onscreen then exit this event and nullify the potentially expensive processes below.
if (!point_in_rectangle(x, y, Camera.border_x1, Camera.border_y1, Camera.border_x2, Camera.border_y2)) {
	x = creator.x;
	y = creator.y;
	exit;
}

// reset steering
//steering = vect2(0,0);

//## Steering Behaviours go below here ##//
// Add like this. (First one doesn't need the vect_add)
var target_x = creator.x + lengthdir_x(creator.speed*16, creator.image_angle);
var target_y = creator.y + lengthdir_y(creator.speed*16, creator.image_angle);
//var target_x = creator.x;
//var target_y = creator.y;

var behaviour = choose(1, 2);
if (behaviour == 1) {
	steering = vect_add(steering, sb_seek_swarmer(target_x, target_y, irandom_range(1, 2), steer_radius));
}
//steering = vect_add(steering, sb_seek_slow(target_x, target_y, irandom_range(1, 2)));
//steering = vect_add(steering, sb_seek_arrive(target_x, target_y, steer_radius, 2));
//steering = vect_add(steering, sb_wander(128/2, steer_radius, irandom_range(90, 180), 3));

//// Use "prioritized dithering" to determine which behaviour to apply if any. 
////var behaviour = choose(1, 2, 3, 0, 0, 0);
//var behaviour = choose(1, 2, 3);
//if (behaviour == 1) {
//	steering = vect_add(steering, sb_seek_slow(target_x, target_y, irandom_range(1, 2)));
//} else if (behaviour == 2) {
//	steering = vect_add(steering, sb_seek_arrive(target_x, target_y, steer_radius, 2));
//} else if (behaviour == 3) {
//	steering = vect_add(steering, sb_wander(128/2, steer_radius, irandom_range(90, 180), 3));
//}
////steering = vect_add(steering, sb_alignment(	obj_swarmer_drone, steer_radius, 1));
////steering = vect_add(steering, sb_separation(obj_swarmer_drone, steer_radius, 2));

//// Use "prioritized dithering" to determine which behaviour to apply if any. 
//var behaviour = choose(1, 2, 3, 0, 0, 0);
//var behaviour = choose(1, 2);
//steering = vect_add(steering, sb_seek_slow(target_x, target_y, irandom_range(1, 2)));

//if (behaviour == 1) {
//	steering = vect_add(steering, sb_seek_arrive(target_x, target_y, steer_radius, 2));
//} else if (behaviour == 2) {
//	steering = vect_add(steering, sb_wander(128/2, steer_radius, irandom_range(90, 180), 3));
//}
////steering = vect_add(steering, sb_alignment(	obj_swarmer_drone, steer_radius, 1));
////steering = vect_add(steering, sb_separation(obj_swarmer_drone, steer_radius, 2));

//## Steering Behaviours go above here ##//
//Limit steering by max_force
steering = vect_truncate(steering, max_force); 

// Limit velocity to max_speed
velocity = vect_truncate(vect_add(velocity, steering),max_speed); 

//Add velocity to position
position = vect_add(position, velocity);

//update xy and limit xy to a coordinate within a radius of the parent object this swarmer is following.
var distance = clamp(point_distance(position[1], position[2], target_x, target_y), 0, steer_radius);
var offset_x = lengthdir_x(distance, point_direction(target_x, target_y, position[1], position[2]));
var offset_y = lengthdir_y(distance, point_direction(target_x, target_y, position[1], position[2]));
position[1] = target_x + offset_x;
position[2] = target_y + offset_y;
x = position[1];
y = position[2];

//update image angle
image_angle = vect_direction(velocity);
