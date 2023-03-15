// Main Code
if instance_exists(grapple_target) {
	// Set the creator object's orbital position relative to the distance between the creator and the target.
	creator.x = grapple_target.x + lengthdir_x(grapple_length, grapple_angle);
	creator.y = grapple_target.y + lengthdir_y(grapple_length, grapple_angle);
	
	// Set a new orbital angle for the code above. Incremented using the creator's current speed.
	// Orbital Formula: 360 / (2*pi*r/v) = 360 Degrees / (2pi * Radius / Velocity).
	grapple_angle += 360/(2*pi*grapple_length/creator.speed) * creator_direction;

	// Set the creator object direction to be perpendicular to the target object.
	creator.image_angle = grapple_angle + 90 * creator_direction;
	
	// Allow the creator object to increase thier speed while grappled.
	with(creator){
		if keyboard_check(ord("W")){
			speed = clamp(speed+0.05, 0, ship_max_speed);	
		}
	}
	
	// Decrease the grapple length.
	if mouse_check_button(mb_side1){
		grapple_length = clamp(grapple_length + 2, -350, -(grapple_target.sprite_width/2 + creator.sprite_width));
	}
	// Increase the grapple length.
	if mouse_check_button(mb_side2){
		grapple_length = clamp(grapple_length - 2, -350, -(grapple_target.sprite_width/2 + creator.sprite_width));
	}
	// Gradually increase the grapple length if grapple length is less than the minimum.
	if grapple_length > -(grapple_target.sprite_width/2 + creator.sprite_width){
		grapple_length = clamp(grapple_length - 2, -350, 300);
	}		
	
	// Position the grapple object at the creator object.
	x = creator.x;
	y = creator.y;	
} 
// If the grapple target has been destroyed - destroy grapple.
else instance_destroy();
