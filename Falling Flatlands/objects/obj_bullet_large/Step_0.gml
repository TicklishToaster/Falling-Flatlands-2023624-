// If object is beyned 1.5x the camera boundaries
if (!point_in_rectangle(x, y, 
				obj_camera.camera_x-obj_camera.camera_width, 
				obj_camera.camera_y-obj_camera.camera_height, 
				obj_camera.camera_x+obj_camera.camera_width, 
				obj_camera.camera_y+obj_camera.camera_height)) {
	instance_destroy();	
}
