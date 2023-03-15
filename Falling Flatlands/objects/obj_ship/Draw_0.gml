//draw_self();

//// Draw External Sprites
//var gun_combo;
//gun_combo[0][0] = 0
//gun_combo[1][0] = 1
//gun_combo[0][1] = 2
//gun_combo[1][1] = 3
//gun_combo = gun_combo[ship_powerups.spread_shot][ship_powerups.scatter_shot]
//var orbitor_combo = gun_combo;

//var gun_colour = c_white;
//if ship_powerups.rapid_shot {
//	orbitor_rot++;
//	gun_colour = c_orange;
//}

//draw_sprite_ext(spr_ship_guns, gun_combo, x, y, image_xscale, image_yscale, image_angle, gun_colour, image_alpha);

//if ship_powerups.laser_shot {
//	orbitor_rot++;
//	draw_sprite_ext(spr_ship_orbitor, 0, x, y, image_xscale, image_yscale, 0, gun_colour, image_alpha);
//	switch(orbitor_combo) {
//		case 0:
//			draw_sprite_ext(spr_ship_laser, 0, x, y, image_xscale, image_yscale, orbitor_rot, gun_colour, image_alpha);
//		break;
//		case 1:
//			for (var i = -1; i <= 1 ; i++){
//				draw_sprite_ext(spr_ship_laser, 0, x, y, image_xscale, image_yscale, orbitor_rot + (i * 35), gun_colour, image_alpha);
//			}
//		break;
//		case 2:
//			for (var i = 0; i <= 3 ; i++){
//				draw_sprite_ext(spr_ship_laser, 0, x, y, image_xscale, image_yscale, orbitor_rot + (i * 90), gun_colour, image_alpha);
//			}		
//		break;
//		case 3:
//			for (var i = 0; i <= 7 ; i++){
//				draw_sprite_ext(spr_ship_laser, 0, x, y, image_xscale, image_yscale, orbitor_rot + (i * 45), gun_colour, image_alpha);
//			}			
//		break;
//	}
//}


//// Draw Shield
//if ship_shield_enabled {
//	//var shield_alpha = min(1, alarm[2]/180);
//	draw_sprite_ext(spr_ship_shield, 0, x, y,
//	image_xscale, image_yscale, image_angle, image_blend, image_alpha);	
//}

//// Draw Grapple Marker
//if collision_rectangle(mouse_x-10, mouse_y-10, mouse_x+10, mouse_y+10, obj_asteroid, true, false){
//	var target = collision_rectangle(mouse_x-10, mouse_y-10, mouse_x+10, mouse_y+10, obj_asteroid, true, false);
//	if point_distance(x, y, target.x, target.y) < 350 {
//		draw_sprite_ext(spr_grapple_hook, 0, target.x, target.y, 1, 1, target.image_angle, c_white, 0.4);	
//	}		
//}
