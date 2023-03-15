// Store the target id, length of rope and angle towards grapple target.
grapple_target = collision_rectangle(mouse_x-10, mouse_y-10, mouse_x+10, mouse_y+10, obj_asteroid, true, false);
grapple_length = -point_distance(creator.x, creator.y, grapple_target.x, grapple_target.y);
grapple_angle = point_direction(creator.x, creator.y, grapple_target.x, grapple_target.y);

// Store direction the ship should face (clockwis/anti-clockwise).
if angle_difference(grapple_angle, creator.image_angle) > 0 {
	creator_direction =  -1;
} else creator_direction = 1;

// Set a low depth to ensure the drawn sprite overlaps any targeted object.
depth = - 1000