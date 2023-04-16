/// @description vect_dist(vect1,vect2)
/// @param vect1
/// @param vect2
function vect_dist(argument0, argument1) {
	//returns the distance between vect1 and vect2
	var i;
	var v1 = argument0;
	var v2 = argument1;

	var num = min(v1[0],v2[0]);
	var tot = 0;
	for(i=1; i<= num; i++)
	{
	    tot+=v1[i]*v1[i] + v2[i] * v2[i];
	}
	if(tot != 0)
	{
	    tot = sqrt(tot);
	}
	return tot;




}
