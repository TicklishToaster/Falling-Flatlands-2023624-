if (!instance_exists(creator)){
	instance_destroy();
	exit;
}
if !keyboard_check(vk_space){
	instance_destroy();
	exit;
}

x = creator.x;
y = creator.y;
direction = creator.image_angle + dir_offset;