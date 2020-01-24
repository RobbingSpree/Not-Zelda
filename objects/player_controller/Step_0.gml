/// @description follow current player

var change = keyboard_check_pressed(vk_space);

if state == "follow"
{
	if change 
	{
		for (var i=0; i<4; i++)
		{
			target +=1;
			if target == 5
				target=1;
			if players[target,1]=true
				break;
		}
		players[target,0].state="idle";
		x=players[target,0].x;
		y=players[target,0].y;
		camera_set_view_pos(view_camera[0],x,y);
		switch target
		{
			//update view depending on current player
			case 1: camera_set_view_target(view_camera[0],sword); update_state(sword); break;
			case 2: camera_set_view_target(view_camera[0],dancer); update_state(dancer); break;
			case 3: camera_set_view_target(view_camera[0],singer); update_state(singer); break;
			case 4: camera_set_view_target(view_camera[0],princess); update_state(princess); break;
		}
	}
	target_x=(players[target,0].x div camera_get_view_width(view_camera[0]))*camera_get_view_width(view_camera[0]);
	target_y=(players[target,0].y div camera_get_view_height(view_camera[0]))*camera_get_view_height(view_camera[0]);
}

if (abs(x-target_x)) < spd {
	x = target_x;
	state = "follow";
	players[target,0].state="idle";
} else {
	state="moving";
	if (target_x>x) {
		x+=spd;
	} else if (target_x<x){
		x-=spd;
	}
}

if (abs(y-target_y)) < spd {
	y = target_y;
	state = "follow";
	players[target,0].state="idle";
} else {
	state="moving";
	if (target_y>y) {
		y+=spd;
	} else if (target_y<y){
		y-=spd;
	}
}

if state == "moving"
{
	players[target,0].state = "camera";
}
camera_set_view_pos(view_camera[0],x,y);