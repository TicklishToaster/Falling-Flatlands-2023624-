/// @description vect4(x,y,z,a)
/// @param x
/// @param y
/// @param z
/// @param a
function vect4(argument0, argument1, argument2, argument3) {
	//creates a 4d vector
	//usage
	// v = vect4(10,10,10,10)
	// num_components = v[0]; // == 4
	// x = v[1];
	// y = v[2];
	// z = v[3];
	// a = v[4];
	var v;
	v[0] = 4;
	v[1] = argument0;
	v[2] = argument1;
	v[3] = argument2;
	v[4] = argument3;
	return v;




}
