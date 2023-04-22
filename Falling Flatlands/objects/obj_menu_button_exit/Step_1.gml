// Input Mouse Controls
input_mouse1_click		= mouse_check_button_pressed(mb_left);
input_mouse1_hold		= mouse_check_button(mb_left);
input_mouse1_release	= mouse_check_button_released(mb_left);
input_mouse2_click		= mouse_check_button_pressed(mb_right);
input_mouse2_hold		= mouse_check_button(mb_right);
input_mouse2_release	= mouse_check_button_released(mb_right);
input_mouse4_click		= mouse_check_button_pressed(mb_side1);
input_mouse4_hold		= mouse_check_button(mb_side1);
input_mouse5_click		= mouse_check_button_pressed(mb_side2);
input_mouse5_hold		= mouse_check_button(mb_side2);

x = uc_get_view_x() + start_x;
y = uc_get_view_y() + start_y;

