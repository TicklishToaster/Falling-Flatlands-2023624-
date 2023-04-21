/// @description Cleanup Minimap
// Clear minimap_surface after drawing to prevent image bleeding.
if (surface_exists(minimap_surface)) {
	surface_set_target(minimap_surface);
	draw_clear_alpha(0,0);
	surface_reset_target();
}