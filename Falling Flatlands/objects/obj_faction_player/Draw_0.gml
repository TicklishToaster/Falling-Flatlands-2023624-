// Draw Shield ////////////////////////////////////////////////////////////////
// Create new shield surface if none exist.
if (!surface_exists(shield_surface)) {
	shield_surface = surface_create(sprite_get_width(shield_sprite)*4, sprite_get_height(shield_sprite)*4);
}

// Set game to draw to shield surface.
surface_set_target(shield_surface);

// Set shield colour and alpha values.
var shield_colour = make_colour_rgb(0, 0, 196);
var shield_alpha = 0.8;
if (shield_enabled) {
	shield_colour = make_colour_rgb(0, 0, 255);
	shield_alpha = 1.0;
} else if (!shield_enabled && shield_points < 1) {
	shield_alpha = 0.0;
}

// Draw shield sprite (Certain values are multiplied by 4 to reduce anti-aliasing).
draw_sprite_ext(shield_sprite, 0,
	sprite_get_xoffset(shield_sprite)*4, sprite_get_yoffset(shield_sprite)*4, 
	4, 4, image_angle, shield_colour, shield_alpha);

// Draw shield impact effects.
for (var i = 0; i < array_length(collision_detection_data); i += 1) {
	//if (collision_detection_data[i][5]-4 > 0 && collision_detection_data[i][7] == true ) {
	if (collision_detection_data[i][5]-4 > 0 && collision_detection_data[i][7] == true ) {
		// Interpolate the position to draw shield impact sprite (relative to shield surface).
		var offset_x = collision_detection_data[i][0] - uc_get_view_x();
		var offset_y = collision_detection_data[i][1] - uc_get_view_y();
		var surface_x = offset_x + sprite_get_xoffset(shield_sprite) - (x - uc_get_view_x());
		var surface_y = offset_y + sprite_get_yoffset(shield_sprite) - (y - uc_get_view_y());	

		// Remove alpha channel and draw spr_shield_impact so that it recolours a segment of the shield sprite.
		gpu_set_colourwriteenable(1, 1, 1, 0);
		draw_sprite_ext(spr_shield_impact, 0, surface_x*4, surface_y*4, 
						(collision_detection_data[i][5]-4)*4, (collision_detection_data[i][5]-4)*4, 
						0, -1, 1);
		gpu_set_colourwriteenable(1, 1, 1, 1);
	}
}

// Reset game to draw to application surface. 
surface_reset_target();

// Draw shield_surface.
draw_surface_ext(shield_surface, 
	x-sprite_get_xoffset(shield_sprite), y-sprite_get_yoffset(shield_sprite),
	0.25, 0.25, 0, -1, 1);