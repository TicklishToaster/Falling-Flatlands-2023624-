// Update Hotspot (Center of Player Sprite)
hotspot_x = x;
hotspot_y = y;

// Adjust parallax scrolling values.
obj_camera.background_shift_x += hspeed/4;
obj_camera.background_shift_y += vspeed/4;
//show_debug_message(vspeed);
//show_debug_message(hspeed);