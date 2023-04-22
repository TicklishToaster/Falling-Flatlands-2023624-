// Destroy projectile if it goes beyond the camera boundaries.
var n = 96;
if (!point_in_rectangle(x, y, Camera.border_x1 - n, Camera.border_y1 - n, Camera.border_x2 + n, Camera.border_y2 + n)) {
	instance_destroy(self, false);
}


// Destroy projectile if hp reduced to 0.
if (projectile_hp <= 0) {
	instance_destroy();
}

