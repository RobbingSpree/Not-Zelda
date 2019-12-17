/// @description update state and move character

var _l = keyboard_check(vk_left);
var _r = keyboard_check(vk_right);
var _d = keyboard_check(vk_down);
var _u = keyboard_check(vk_up);

//debug
//h-=keyboard_check_pressed(vk_control);

if state == "idle" || state == "walking"
{
	sprite_index = walk_spr;
	if _r || _l || _u || _d
	{
		ani +=1;
		if ani == ani_spd
		{
			if facing >=2
				if wlk_cycle==0
					wlk_cycle=1;
				else
					wlk_cycle=0;
			else
				if image_xscale==1
					image_xscale=-1;
				else
					image_xscale=1;
			ani=0;
		}
		state="walking";
	} else 
		state="idle";

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
	var hbox = place_meeting(x+(_r-_l)*wlk_spd,y,box);
	if hbox != -4
	{
		//change to pushing
		sprite_index=push_spr;
	}
	var vbox = place_meeting(x,y+(_d-_u)*wlk_spd,box);
	if vbox != -4
	{
		//change to pushing
		sprite_index=push_spr;
	}
}
//move player
x+=(_r-_l)*wlk_spd;
y+=(_d-_u)*wlk_spd;