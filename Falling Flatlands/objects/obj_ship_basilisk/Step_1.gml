// Inherit the parent event
event_inherited();


// Calculate Valid Targets ////////////////////////////////////////////////////
// Find and store all enemies that are within range of the player.
var targets_in_range = [];
var range_modifier = 0.6;
for (var i = 0; i < instance_number(obj_faction_enemy); i += 1) {
	var target_iteration = instance_find(obj_faction_enemy, i);
	if (point_in_rectangle(target_iteration.x, target_iteration.y,	
		self.x-Camera.camera_width*range_modifier, self.y-Camera.camera_height*range_modifier,
		self.x+Camera.camera_width*range_modifier, self.y+Camera.camera_height*range_modifier)) 
		{
		array_push(targets_in_range, target_iteration);
	}	
}

// Update the target list if it does not contain every valid target currently onscreen.
if (ds_grid_height(target_list) != array_length(targets_in_range)) {
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
	
	// If a target was already set, calculate its new index so that the same target remains marked.
	for (var i = 0; i < ds_grid_height(target_list); i += 1) {
		if (ds_grid_get(target_list, 0, i) == projectile_target) {
			target_index = i;
		}
	}
	
	// If a target was already set but is now out of valid range, reset the current target to the nearest available enemy.
	if (instance_exists(projectile_target) && !point_in_rectangle(projectile_target.x, projectile_target.y,	
		self.x-Camera.camera_width*range_modifier, self.y-Camera.camera_height*range_modifier,
		self.x+Camera.camera_width*range_modifier, self.y+Camera.camera_height*range_modifier)) 
		{
		target_index	= 0;
		projectile_target = ds_grid_get(target_list, 0, target_index);
		crosshair_target_sprite_frame = 0;
	}
	
	// If no target is set, set target to the nearest available enemy.
	if (!instance_exists(projectile_target) && ds_grid_height(target_list) > 0) {
		target_index	= 0;
		projectile_target = ds_grid_get(target_list, 0, target_index);
		crosshair_target_sprite_frame = 0;
	}
}

