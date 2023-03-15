// If object is beyond 2x the camera boundaries
if (!point_in_rectangle(x, y, 
				obj_camera.camera_x-obj_camera.camera_width *1, 
				obj_camera.camera_y-obj_camera.camera_height*1, 
				obj_camera.camera_x+obj_camera.camera_width *1, 
				obj_camera.camera_y+obj_camera.camera_height*1)) {
	instance_destroy(self, false);
}

if (projectile_hp <= 0) {
	instance_destroy();
}