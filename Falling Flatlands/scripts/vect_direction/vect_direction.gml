/// @description vect_direction(vector)
/// @param vector
function vect_direction() {
	//returns direction of given vector
	var _vec=argument[0];
	if(_vec[1]==0 && _vec[2]==0)
	    return(-1);
	else
	    return(point_direction(0,0,_vec[1],_vec[2]));




}
