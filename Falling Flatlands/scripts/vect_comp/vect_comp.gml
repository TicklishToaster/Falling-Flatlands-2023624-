/// @description vect_comp(vect1, vect2)
/// @param vect1
/// @param  vect2
function vect_comp(argument0, argument1) {
	//compares each component of vect1 with each component of vect2
	//returns true if same
	var i;
	var v1 = argument0;
	var v2 = argument1;
	var truect = 0;

	var num = min(v1[0],v2[0]);

	for(i=1; i<= num; i++)
	{
	    truect+= v1[i]==v2[i];
	}
	return truect == max(v1[0],v2[0]);




}
