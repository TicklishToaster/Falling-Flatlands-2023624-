/// @description OLD CODE

//// Exit if object is part of same faction.
//if (other.faction == faction) {
//	exit;
//}

//// Take damage if object is an enemy faction.
//if (other.faction == factions.enemy && !iframes_enabled) {
//	// Cancel damage if shield is active.
//	if (shield_enabled) {
//		audio_play_sound(choose(
//		SFX__FTL____Shield_Hit_Impact__A_,
//		SFX__FTL____Shield_Hit_Impact__B_,
//		SFX__FTL____Shield_Hit_Impact__C_), 
//		10, false);
		
//		for (var i1 = 0; i1 < array_length(shield_impact_position); i1 += 1) {
//			show_debug_message(shield_impact_position[i1])
//			if (shield_impact_position[i1][0] == false || shield_impact_position[array_length(shield_impact_position)][0] == true) {
//				shield_impact_position[i1][0] = true;
				
//				var damage_direction = point_direction(x, y, other.creator.x, other.creator.y)
//				var damage_angle = image_angle;
				
//				for (var i2 = 0; i2 < 64; i2 += 1) {
//					if (position_meeting(x + lengthdir_x(i2, damage_direction), y + lengthdir_y(i2, damage_direction), obj_ship_squire) == true) {
//						//shield_impact_position[i1][1] = x + lengthdir_x(i2, damage_direction);
//						//shield_impact_position[i1][2] = y + lengthdir_y(i2, damage_direction);
//						//var damage_x_pos = x + lengthdir_x(i2, damage_direction);
//						//var damage_y_pos = y + lengthdir_y(i2, damage_direction);
					
//						//var damage_direction = damage_direction;
//						//var damage_angle = image_angle;
//						//var damage_len = i2;
//						//var damage_timer = 1;
				
//					} 
//					else {
//						//shield_impact_position[i1][1] = damage_x_pos;
//						//shield_impact_position[i1][2] = damage_y_pos;
//						shield_impact_position[i1][1] = x + lengthdir_x(i2, damage_direction);
//						shield_impact_position[i1][2] = y + lengthdir_y(i2, damage_direction);
//						shield_impact_position[i1][3] = damage_direction;
//						shield_impact_position[i1][4] = damage_angle;
//						shield_impact_position[i1][5] = i2;
//						shield_impact_position[i1][6] = 1;			
//						break;
//					}
//				}
//				break;
//			}
		
//			instance_destroy(other);
//			exit;
//		}		
//	}
	
//	instance_destroy(other);
	
//	// Enable I-Frames.
//	iframes_enabled = true;
	
//	// Change health.
//	health_points -= 1;

//	// Play audio clip for taking damage.
//	audio_play_sound(SFX__ITB____Ship_Damage, 10, false);

//	// Play special audio clip if health is critical.
//	if (health_points == 1) {
//		audio_play_sound(UI__ITB____Critical_Health, 10, false);
//	}
//}

///========================================================

//draw_self();


//// Draw Shield
//var shield_sprite = spr_squire_shield;

////damage_x_pos = x + lengthdir_x(damage_len, damage_direction+image_angle-damage_angle);
////damage_y_pos = y + lengthdir_y(damage_len, damage_direction+image_angle-damage_angle);
	
//////if (damage_timer_enable) {
////if (damage_timer > 0) {
////	damage_timer = clamp(damage_timer - (room_speed / 60 / 60), 0, 5);
////}
	

//if (!surface_exists(masking_surface)) {
//	masking_surface = surface_create(sprite_get_width(shield_sprite)*4, sprite_get_height(shield_sprite)*4);
//}

//surface_set_target(masking_surface);

//var shield_colour = make_colour_rgb(0, 0, clamp(128 + (255 * shield_points / shield_points_max), 0, 255));
//var shield_alpha = 0.8;
//if (shield_enabled) {
//	shield_colour = make_colour_rgb(0, 0, clamp(128 + (255 * shield_points / shield_points_max), 192, 255));
//	shield_alpha = 1.0;
//} else if (!shield_enabled && shield_points < 1) {
//	shield_alpha = 0.0;
//}

////var shield_colour = make_colour_rgb(0, 0, 255);
////var shield_alpha = clamp(0.6 + (shield_points / shield_points_max) * 0.1, 0.6, 0.8);
////show_debug_message(shield_alpha)
//////if (!shield_enabled && shield_points < 1) {shield_alpha = 0.0;}
	
//draw_sprite_ext(shield_sprite, 0,
//	sprite_get_xoffset(shield_sprite)*4, sprite_get_yoffset(shield_sprite)*4, 
//	4, 4, image_angle, shield_colour, shield_alpha);

////var camera_length = camera_get_view_x(view_camera[0])
////var camera_height = camera_get_view_y(view_camera[0])
////var camera_center_x = camera_get_view_width(view_camera[0])/2;
////var camera_center_y = camera_get_view_height(view_camera[0])/2;
////var offset_x = damage_x_pos - camera_length;
////var offset_y = damage_y_pos - camera_height;
////var surface_x = offset_x-camera_center_x+sprite_get_xoffset(shield_sprite);
////var surface_y = offset_y-camera_center_y+sprite_get_yoffset(shield_sprite);

//var camera_length = camera_get_view_x(view_camera[0])
//var camera_height = camera_get_view_y(view_camera[0])
//var camera_center_x = camera_get_view_width(view_camera[0])/2;
//var camera_center_y = camera_get_view_height(view_camera[0])/2;
	
//for (var i1 = 0; i1 < array_length(shield_impact_position); i1 += 1) {
//	if (shield_impact_position[i1][0] == true && shield_impact_position[i1][6] > 0) {
//		//shield_impact_position[i1][1] = X
//		//shield_impact_position[i1][2] = Y
//		//shield_impact_position[i1][3] = damage_direction;
//		//shield_impact_position[i1][4] = damage_angle;
//		//shield_impact_position[i1][5] = damage_length
//		//shield_impact_position[i1][6] = damage_timer
		
//		var impact_id = shield_impact_position[i1];
//		//shield_impact_position[i1][1] = x + lengthdir_x(shield_impact_position[i1][5], shield_impact_position[i1][3]+image_angle-shield_impact_position[i1][4]);
//		//shield_impact_position[i1][2] = y + lengthdir_y(shield_impact_position[i1][5], shield_impact_position[i1][3]+image_angle-shield_impact_position[i1][4]);
//		//damage_x_pos = x + lengthdir_x(damage_len, damage_direction+image_angle-damage_angle);
//		//damage_y_pos = y + lengthdir_y(damage_len, damage_direction+image_angle-damage_angle);
//		//if (damage_timer > 0) {
//		//	damage_timer = clamp(damage_timer - (room_speed / 60 / 60), 0, 5);
//		//}			
//		shield_impact_position[i1][1] = x + lengthdir_x(impact_id[5], impact_id[3]+image_angle-impact_id[4]);
//		shield_impact_position[i1][2] = y + lengthdir_y(impact_id[5], impact_id[3]+image_angle-impact_id[4]);
//		shield_impact_position[i1][6] = clamp(impact_id[6] - (room_speed / 60 / 60), 0, 1);
//		var impact_id = shield_impact_position[i1];
	
//		var offset_x = impact_id[1] - camera_length;
//		var offset_y = impact_id[2] - camera_height;
//		var surface_x = offset_x-camera_center_x+sprite_get_xoffset(shield_sprite);
//		var surface_y = offset_y-camera_center_y+sprite_get_yoffset(shield_sprite);	
	
//		gpu_set_colourwriteenable(1, 1, 1, 0);
//		draw_sprite_ext(spr_shield_impact, 0, surface_x*4, surface_y*4, impact_id[6]*4, impact_id[6]*4, 0, -1, 1);
//		gpu_set_colourwriteenable(1, 1, 1, 1);
//	}
//	else if (shield_impact_position[i1][6] <= 0) {
//		shield_impact_position[i1][0] = false;
//		shield_impact_position[i1][1] = 0;
//		shield_impact_position[i1][2] = 0;
//		shield_impact_position[i1][3] = 0;
//		shield_impact_position[i1][4] = 0;
//		shield_impact_position[i1][5] = 0;
//		shield_impact_position[i1][6] = 0;
//	}
	
//}
////draw_sprite_ext(spr_test_circle49, 0, surface_x*4, surface_y*4, 4, 4, 0, c_yellow, 1);


//surface_reset_target();
//draw_surface_ext(masking_surface, 
//	x-sprite_get_xoffset(shield_sprite), y-sprite_get_yoffset(shield_sprite),
//	0.25, 0.25, 0, -1, 1);


//draw_sprite_ext(spr_test_circle49, 0, mouse_x+0, mouse_y+0, 1, 1, 0, c_lime, 1)


////// Draw a line from ship center to edge of ship at the point of impact.
////var my_dir = point_direction(x, y, my_x, my_y)			
////for (var i = 0; i < 32; i += 1) {
////	if (position_meeting(x + lengthdir_x(i, my_dir), y + lengthdir_y(i, my_dir), obj_ship_squire) == true) {
////		draw_line_width(x, y, x + lengthdir_x(i, my_dir), y + lengthdir_y(i, my_dir), 2)
////	}
////}


