/// @description sb_seek_slow(x, y, weight)
/// @arg x
/// @arg y
/// @arg weight
///Return vector2 for steering towards given point
function sb_seek_slow() {
	var _target = vect2(argument[0], argument[1]);
	var _weight = argument[2];
	var _normal_right,_normal_left,_target_angle,_angle_dif,_new_steering,_velocity_angle;

	// normal_right/left are the normal vectors of the current direction of movement, that means they are orthogonal to the current movement direction
	_normal_right =   vect_truncate(vect2(-velocity[2],velocity[1]),max_rot_force);
	_normal_left =   vect_truncate(vect2(velocity[2],-velocity[1]),max_rot_force);

	//angle the object needs to point to the target
	_target_angle = point_direction(x,y,_target[1],_target[2]);

	//current angle of movement
	_velocity_angle = point_direction(0,0,velocity[1],velocity[2]);

	//calculate the difference
	_angle_dif = angle_difference(_velocity_angle,_target_angle);


	// "turn left"/"turn right" according to angle_difference
	if (_angle_dif >= 0){
	    _new_steering = vect_add(velocity,_normal_right);
	}
	if (_angle_dif < 0){
	    _new_steering = vect_add(velocity,_normal_left);
	}
     
	return (vect_multr(_new_steering,_weight));
}