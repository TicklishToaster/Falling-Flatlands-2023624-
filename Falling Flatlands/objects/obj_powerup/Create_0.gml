/// @description Choose Frame
image_index = irandom_range(0, image_number-1);
switch(image_index){
	case 0:
		name = "Spread";
		break;
	case 1:
		name = "Scatter";
		break;
	case 2:
		name = "Rapid";
		break;	
	case 3:
		name = "Laser";
		break;	
}

alarm[0] = 5 * room_speed;

image_blend = c_lime;
if image_index == 2 {image_blend = c_orange;}

image_speed = 0;

// TEST CODE
//show_debug_message(name)
//image_index = 4;
//name = "Shield";

