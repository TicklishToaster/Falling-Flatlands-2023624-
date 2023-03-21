// Update Hotspot (Center of Player Sprite)
hotspot_x = x;
hotspot_y = y;

// Adjust parallax scrolling values.
obj_camera.background_shift_x += hspeed/4;
obj_camera.background_shift_y += vspeed/4;


// Calculate Valid Targets ////////////////////////////////////////////////////
// Find and store all enemies that are within range of the player.
var targets_in_range = [];
var range_modifier = 0.3;
for (var i = 0; i < instance_number(obj_faction_enemy); i += 1) {
	var target_iteration = instance_find(obj_faction_enemy, i);
	if (point_in_rectangle(target_iteration.x, target_iteration.y,	
		self.x-obj_camera.camera_width*range_modifier, self.y-obj_camera.camera_height*range_modifier,
		self.x+obj_camera.camera_width*range_modifier, self.y+obj_camera.camera_height*range_modifier)) 
		{
		array_push(targets_in_range, target_iteration);
	}	
}

// Update the target list if grapple mode is disabled.
if (!grapple_mode || !instance_exists(grapple_target)) {
	// Renew the target list with empty data.
	target_list = ds_grid_create(2, array_length(targets_in_range));
	
	// For each enemy object onscreen, add thier instance id and relative distance from the player.
	for (var i = 0; i < array_length(targets_in_range); i += 1) {
		var target_iteration = targets_in_range[i];		
		var taret_distance = point_distance(x, y, target_iteration.x, target_iteration.y);
		ds_grid_add(target_list, 0, i, target_iteration);
		ds_grid_add(target_list, 1, i, taret_distance);
	}
	
	// Sort target list in order from smallest distance to largest distance.
	ds_grid_sort(target_list, 1, true);

	if (ds_grid_height(target_list) > 0) {
		if (grapple_target != ds_grid_get(target_list, 0, 0)) {
			grapple_target = ds_grid_get(target_list, 0, 0);
			crosshair_target_sprite_frame = 0;
		}
	}
	else {
		grapple_target = noone;
	}
}

//// If a target was already set, calculate its new index so that the same target remains marked.
//for (var i = 0; i < ds_grid_height(target_list); i += 1) {
//	if (ds_grid_get(target_list, 0, i) == grapple_target) {
//		target_index = i;
//	}
//}
	
//// If a target was already set but is now out of valid range, reset the current target to the nearest available enemy.
//if (instance_exists(grapple_target) && !point_in_rectangle(grapple_target.x, grapple_target.y,	
//	self.x-obj_camera.camera_width*range_modifier, self.y-obj_camera.camera_height*range_modifier,
//	self.x+obj_camera.camera_width*range_modifier, self.y+obj_camera.camera_height*range_modifier)) 
//	{
//	target_index	= 0;
//	grapple_target = ds_grid_get(target_list, 0, target_index);
//	crosshair_target_sprite_frame = 0;
//}
	
//// If no target is set, set target to the nearest available enemy.
//if (!instance_exists(grapple_target) && ds_grid_height(target_list) > 0) {
//	target_index	= 0;
//	grapple_target = ds_grid_get(target_list, 0, target_index);
//	crosshair_target_sprite_frame = 0;
//}
//}
