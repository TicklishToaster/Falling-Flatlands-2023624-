//collider_parent			= noone;
//collision_id			= 0;
//explosion_sprite_id		= noone;
//explosion_sprite_frame	= 0;
//explosion_sprite_speed	= 0;
//explosion_sprite_colour	= c_white;

explosion_sprite_frame = clamp(explosion_sprite_frame + explosion_sprite_speed, 0, sprite_get_number(explosion_sprite_id))
//if (explosion_sprite_frame >= sprite_get_number(explosion_sprite_id)) {
//	explosion_sprite_frame = 0;
//}



if (explosion_sprite_frame >= sprite_get_number(sprite_index)-1) {
	instance_destroy()
}


//animation_frame = clamp(animation_frame + (room_speed / 60 / 5), 0, sprite_get_number(sprite_index)-1);
//animation_frame = clamp(animation_frame + (room_speed / 60 / 5), 0, sprite_get_number(sprite_index)-1);
//explosion_sprite_frame = clamp(explosion_sprite_frame + animation_speed, 0, sprite_get_number(sprite_index)-1);
explosion_sprite_frame = clamp(explosion_sprite_frame + explosion_sprite_speed, 0, sprite_get_number(explosion_sprite_id))

//show_debug_message(collider_parent)
//show_debug_message(collider_parent.collision_detection_data)

x = collider_parent.collision_detection_data[collision_id][0];
y = collider_parent.collision_detection_data[collision_id][1];

