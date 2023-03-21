// Set defaulttarget if none exists.
if (!instance_exists(target)) {
	target = obj_faction_player;
}


// Update Hotspot (Center of Camera)
hotspot_x = x + camera_width /2;
hotspot_y = y + camera_height/2;