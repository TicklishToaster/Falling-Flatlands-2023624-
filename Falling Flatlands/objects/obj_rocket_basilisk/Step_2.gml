// Destroy projectile if it goes beyond the camera boundaries.
if (!point_in_rectangle(x, y, Camera.border_x1, Camera.border_y1, Camera.border_x2, Camera.border_y2)) {
	instance_destroy(self, false);
}


// Destroy projectile if hp reduced to 0.
if (projectile_hp <= 0) {
	instance_destroy();
}

