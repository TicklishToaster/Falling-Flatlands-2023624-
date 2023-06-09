/// @description sb_cohesion(object, radius, weight)
/// @param object
/// @param  radius
/// @param  weight
///Return vector2 for aligning location with given object in given radius
///Uses collision_circle_list from GMLscripts.com
function sb_cohesion() {

	var _sep_obj = argument[0];
	var _sep_radius = argument[1];
	var _weight = argument[2];

	var _neighbour_list = collision_circle_list(position[1], position[2], _sep_radius, _sep_obj, false, true, true, true);

	if(_neighbour_list != noone) { // Has neighbours
	    var _neighbour_num = ds_list_size(_neighbour_list);
	    var _aligned_position = vect2(0,0);
    
	    for(i=0; i<_neighbour_num; i++) {
	        _aligned_position = vect_add(_aligned_position, _neighbour_list[|i].position);
	    }

	    _aligned_position = vect_divr(_aligned_position, _neighbour_num);

	    //destroy temp ds_list
	    ds_list_destroy(_neighbour_list);
    
	    //return aligned velocity
	    return (vect_multr(vect_norm(vect_subtract(_aligned_position,position)),_weight));
	} else { // No neighbours
	    return vect2(0,0);
	}





}
