// THIS IS A CUSTOMIZED SCRIPT

/// @description sb_seek_slow(x, y, weight, circle_radius)
/// @arg x
/// @arg y
/// @arg weight
/// @arg circle_radius
///Return vector2 for steering towards given point
function sb_seek_swarmer() {
	var _target = vect2(argument[0], argument[1]);
	var _weight = argument[2];
	var _circle_radius = argument[3];
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
     
	var vector01 = (vect_multr(_new_steering,_weight));
	
	///////////////////////////////////////////////////////////////////////////////////
	// subtract current position from target position and constrain to max_speed
	//var _desired_velocity = vect_scaler(vect_subtract(_target,position),max_speed);
	var _desired_velocity = vect_subtract(_target,position);
	var _distance = vect_len(_desired_velocity);

	if(_distance < _circle_radius) { //Inside slowing radius
	    _desired_velocity = vect_multr(vect_norm(_desired_velocity), max_speed * (_distance / _circle_radius));
	} else { // Outside slowing radius
	    _desired_velocity = vect_multr(vect_norm(_desired_velocity), max_speed);
	}

	var vector02 = (vect_multr(vect_subtract(_desired_velocity,velocity),2));
	
	///////////////////////////////////////////////////////////////////////////////////
	// Use velocity vector to place circle
	var _circle_center = vect_multr(vect_norm(velocity), 64);

	var _displacement = vect2(0, -1);
	_displacement = vect_multr(_displacement, _circle_radius);

	//Set the angle
	var _displacement_length = vect_len(_displacement);
	var _random_angle = random_range(-64, 64);
	_displacement[1] = cos(_random_angle) * _displacement_length;
	_displacement[2] = sin(_random_angle) * _displacement_length;

	var _target_position = vect_add(position,vect_add(_circle_center, _displacement));


	// Set velocity
	var _desired_velocity = vect_scaler(vect_subtract(_target_position,position),max_speed);

	var vector03 = (vect_multr(vect_subtract(_desired_velocity,velocity),3));
	
	
	var new_vector = vect_add(vector01, vector02);
	new_vector = vect_add(new_vector, vector03);
	
	return(new_vector);
}