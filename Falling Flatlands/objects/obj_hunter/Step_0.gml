event_inherited();

// If player ship exists.
if !instance_exists(obj_ship) exit;

// If player is in range.
if point_distance(x, y, obj_ship.x, obj_ship.y) < 280 {
	// Turn to look at target ship.
	// Determine the angle required to face the target ship.
	var new_angle = point_direction(x, y, obj_ship.x, obj_ship.y);
	// Calculate the closest angle required to face the target ship (clock-wise or anti clock-wise).
	new_angle = image_angle - angle_difference(image_angle, new_angle);
	// Lerp towards the calculated angle.
	image_angle = lerp(image_angle, new_angle, 0.1);
	// Move in the direction of the current angle.
	direction = image_angle;
	
	if point_distance(x, y, obj_ship.x, obj_ship.y) < 140 {
		speed -= 0.05;
	}
	else {
		speed += 0.01;
	}
	
	// Fire bullet
	attack_timer++;
	if attack_timer >= room_speed * 2 {
		spawn_bullet(obj_bullet, image_angle, 6, faction);
		audio_play_sound(choose(
		SFX__FTL____Energy_Shot_Light__A_,
		SFX__FTL____Energy_Shot_Light__C_,
		SFX__FTL____Energy_Shot_Light__B_
		), 10, false);
		attack_timer = 0;
	}
}

// Else if player not in range.
else {
	// Return to original speed.
	speed = lerp(speed, original_speed, 0.1)
}
