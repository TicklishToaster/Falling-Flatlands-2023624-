/// @description Buffer Shield Surface
// Clear shield_surface after drawing to prevent image bleeding.
if (surface_exists(shield_surface)) {
	surface_set_target(shield_surface);
	draw_clear_alpha(0,0);
	surface_reset_target();
}
