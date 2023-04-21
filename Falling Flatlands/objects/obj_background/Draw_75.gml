///// @description Cleanup Background

//// Clear minimap_surface after drawing to prevent image bleeding.
//if (surface_exists(background_surface)) {
//	surface_set_target(background_surface);
//	draw_clear_alpha(0,0);
//	surface_reset_target();
//}