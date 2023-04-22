
//explosion_sprite_frame = clamp(explosion_sprite_frame + explosion_sprite_speed, 0, sprite_get_number(explosion_sprite_id))

if (explosion_sprite_frame >= sprite_get_number(sprite_index)-1) {
	instance_destroy()
}

explosion_sprite_frame = clamp(explosion_sprite_frame + explosion_sprite_speed, 0, sprite_get_number(explosion_sprite_id))


// Update the x/y position of the collision, accounting for parent object positioning and angle.
x_pos = collider_parent.x + lengthdir_x(impact_length, impact_direction + collider_parent.image_angle - impact_angle);
y_pos = collider_parent.y + lengthdir_y(impact_length, impact_direction + collider_parent.image_angle - impact_angle);
x = x_pos;
y = y_pos;
