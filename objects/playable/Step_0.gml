/// @description update state and move character

var _l = keyboard_check(vk_left);
var _r = keyboard_check(vk_right);
var _d = keyboard_check(vk_down);
var _u = keyboard_check(vk_up);
var _a = keyboard_check_pressed(ord("Z"));
var _b = keyboard_check_pressed(ord("X"));
var xstop=0;
var ystop=0;
//debug
if keyboard_check_pressed(vk_control) slide_object(self,facing);

if control_lock > 0
{
	control_lock -=1;
	if camera_move
	{
		var _spd = 0.5;
		switch facing
		{
			case 0: y-=_spd; break;
			case 1: y+=_spd; break;
			case 2: x+=_spd; break;
			case 3: x-=_spd; break;
		}
	}
}
if control_lock < 0
	control_lock = 0;

if state == "idle"
{
	if control_lock == 0
	{
		camera_move = false;
		if _r || _l || _u || _d //read input
			state = "walking";
		if _a || _b	
		{
			state = "action";
			if _b
				sprite_index = action_b_spr;
			if _a
				sprite_index = action_a_spr;
		}
	}
}


if state == "walking"
{
	state = "idle";
	sprite_index = walk_spr;
	
	#region Input
	if _r || _l || _u || _d //read input
	{
		state="walking";
		ani +=1;
		if ani == ani_spd //allow game to run at a higher speed than the animation
		{
			//update animation
			if facing >=2 //left or right
				if wlk_cycle==0
					wlk_cycle=1;
				else
					wlk_cycle=0;
			else //up or down
				if image_xscale==1
					image_xscale=-1;
				else
					image_xscale=1;
			ani=0;
		}
		//check for collisions
		adjacent = update_adjacents(adjacent);
	} 
	#endregion
	
	#region Sprite update
	if facing != last_face
	{
		image_xscale=1;
		wlk_cycle=0;
	}

	if _l || _r 
	{
		facing=3-_r;
		if !_u && !_d
			image_index=facing+wlk_cycle-_l;
		if _r
			image_xscale=-1;
		if _l
			image_xscale=1;
	}
	if _u || _d 
	{
		facing=1-_d;	
		image_index=facing;
	}
	last_face=facing;

	//check for collisions
	
	if state == "idle"
	{
		image_index=facing;
	}
	#endregion
	
	#region Start Pushing
	var free = push_space_free(facing)
	if action_buildup>action_threshold && free && state != "pushing"
	{
		if adjacent[facing,1] != noone && adjacent[facing,1].move==true //if running into a moveable object for last 16 frames
		{
			slide_object(self,facing);
			slide_object(adjacent[facing,1],facing);
			pushee=adjacent[facing,1];
			state = "pushing";
			sprite_index = push_spr;
		switch facing
			{
				case 0: image_index = 0; break;
				case 1: image_index = 3; break;
				case 2: image_index = 6; image_xscale=-1; break;
				case 3: image_index = 6; image_xscale=1; break;
			}
		ani=0;
		} 
		
	}
	if !free 
		action_buildup=0;
	#endregion
	
	#region Collision and movement
	
	if adjacent[facing,2] > wlk_spd || adjacent[facing,2] == -1//moving unimpeded
	{
		if facing < 2 && (_r || _l) //if moving diagonally
			{if (adjacent[3,2] > wlk_spd && _l) || (adjacent[2,2] > wlk_spd && _r)
				x+=(_r-_l)*wlk_spd-xstop;
			} else 
				x+=(_r-_l)*wlk_spd-xstop;
		y+=(_d-_u)*wlk_spd-ystop;
		action_buildup=0;
	} else {
		action_buildup+=1;
	}
	
	#endregion
	
}

if state == "action"
{
	//end animation and move back to idle 
	if steps == steps_end
	{
		state = "idle";
		steps=0;
		wlk_cycle=0;
		sprite_index=walk_spr;
		image_index=facing; 
	}
	
	#region Animate
	ani +=1;
	if ani == ani_spd //allow game to run at a higher speed than the animation
	{
		steps+=1;
		ani=0;
		wlk_cycle+=1;
	}
	if _b //prioritize B presses over A
	{
		if equip_b == "sword"
		{
			sprite_index=link_equip_action;
			switch facing
			{
				case 0: image_index = 0+wlk_cycle; break;
				case 1: image_index = 2+wlk_cycle; break;
				case 2: image_index = 4+wlk_cycle; image_xscale=-1; break;
				case 3: image_index = 4+wlk_cycle; image_xscale=1; break;
			}
		}
	} else if _a
	{
		if equip_a == "sword"
		{
			sprite_index=link_equip_action;
			switch facing
			{
				case 0: image_index = 0+steps; break;
				case 1: image_index = 2+steps; break;
				case 2: image_index = 4+steps; image_xscale=-1; break;
				case 3: image_index = 4+steps; image_xscale=1; break;
			}
		}
	}
	#endregion
}

if state == "pushing"
{
	//you have arrived at your destination
	if x==push_x_dest && y==push_y_dest
	{
		state = "idle";
		push_x_dest=-1;
		push_y_dest=-1;
		if pushee != noone
		{
			pushee.push_x_dest=-1;
			pushee.push_y_dest=-1;
		}
		action_buildup=0;
		sprite_index = walk_spr;
		image_index=facing;
		adjacent=update_adjacents(adjacent);
	} else {//keep arms and ears inside the vehicle while object is in motion
		//move_towards_point(push_x_dest,push_y_dest,wlk_spd/2);
		sliding(self,wlk_spd/2);
		if pushee != noone
			with pushee
			{
				sliding(self,0.5);	
			}
		#region Animate
		ani +=1;
		if ani == ani_spd //allow game to run at a higher speed than the animation
		{
			//update animation
			if wlk_cycle==0
				wlk_cycle=1;
			else
				wlk_cycle=0;
			switch facing
			{
				case 0: image_index = 0+wlk_cycle; break;
				case 1: image_index = 3+wlk_cycle; break;
				case 2: image_index = 6+wlk_cycle; image_xscale=-1; break;
				case 3: image_index = 6+wlk_cycle; image_xscale=1; break;
			}
			ani=0;
		}
		#endregion
	}
}