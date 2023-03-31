// Destroy projectile if it goes beyond the camera boundaries.
var border_x1 = uc_get_view_x() - Camera.camera_width  / 2;
var border_y1 = uc_get_view_y() - Camera.camera_height / 2;
var border_x2 = uc_get_view_x() + Camera.camera_width  / 2 + Camera.camera_width;
var border_y2 = uc_get_view_y() + Camera.camera_height / 2 + Camera.camera_height;
if (!point_in_rectangle(x, y, border_x1, border_y1, border_x2, border_y2)) {
	instance_destroy(self, false);
}


// Destroy projectile if hp reduced to 0.
if (projectile_hp <= 0) {
	instance_destroy();
}

