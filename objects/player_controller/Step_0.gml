/// @description Insert description here
// You can write your code in this editor

var change = keyboard_check_pressed(vk_space);

if change 
{
	target +=1;
	if target == 5
		target=1;
	switch target
	{
		//update view depending on current player
		case 1: camera_set_view_target(view_camera[0],sword); update_state(sword); break;
		case 2: camera_set_view_target(view_camera[0],dancer); update_state(dancer); break;
		case 3: camera_set_view_target(view_camera[0],singer); update_state(singer); break;
		case 4: camera_set_view_target(view_camera[0],princess); update_state(princess); break;
	}
}