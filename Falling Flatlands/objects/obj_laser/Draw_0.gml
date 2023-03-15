var len = 300;

// Draw Laser
draw_line_width_color(
	creator.x-1+lengthdir_x(36, angle_offset+1),
	creator.y-1+lengthdir_y(36, angle_offset+1),
	x+lengthdir_x(len, angle_offset+1),
	y+lengthdir_y(len, angle_offset+1), 	
	laser_size, image_blend, image_blend);

// Draw Collision
var hit_scan = collision_line(
	creator.x-1+lengthdir_x(18, angle_offset+1),
	creator.y-1+lengthdir_y(18, angle_offset+1),
	x+lengthdir_x(len, angle_offset),
	y+lengthdir_y(len, angle_offset),
	obj_faction, true, true);

// Check if laser hit a target.
if hit_scan != noone {
	if hit_scan.faction != faction {
		with hit_scan {
			event_perform(ev_other, ev_user0);
		}
	}
}

instance_destroy();