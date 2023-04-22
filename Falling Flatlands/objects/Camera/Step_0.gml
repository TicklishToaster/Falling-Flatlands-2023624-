/// @description Insert description here
// You can write your code in this editor

camera_width = camera_get_view_width(view_camera[0]);
camera_height = camera_get_view_height(view_camera[0]);

target = obj_faction_player;

background_shift_x = 0;
background_shift_y = 0;


border_x1 = uc_get_view_x() - camera_width  / 5;
border_y1 = uc_get_view_y() - camera_height / 5;
border_x2 = uc_get_view_x() + camera_width  / 5 + camera_width;
border_y2 = uc_get_view_y() + camera_height / 5 + camera_height;