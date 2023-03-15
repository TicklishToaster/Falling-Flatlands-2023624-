/// @description Spawn Off Camera
/// @arg obj
/// @arg number
	
function spawn_off_camera(obj, num, xpos = global.cameraX, ypos = global.cameraY){	
	var pad = 128;
	repeat(num){
		var xx = random_range(0, room_width);
		var yy = random_range(0, room_height);
	
		while point_in_rectangle(xx, yy, xpos-pad, ypos-pad, 
		xpos+global.cameraWidth+pad, ypos+global.cameraHeight+pad){
			xx = random_range(0, room_width);
			yy = random_range(0, room_height);
		}
	
		instance_create_layer(xx, yy, "Instances", obj);
	}
}