/// @description update state and move character

var _l = keyboard_check(vk_left);
var _r = keyboard_check(vk_right);
var _d = keyboard_check(vk_down);
var _u = keyboard_check(vk_up);
var xstop=0;
var ystop=0;
//debug
//h-=keyboard_check_pressed(vk_control);

if state == "idle" || state == "walking" || state == "pushing"
{
	sprite_index = walk_spr;
	if _r || _l || _u || _d
	{
		if state=="pushing"
			ani+=0.5;
		else
			ani +=1;
		if ani == ani_spd
		{
			if facing >=2 || state=="pushing"
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
	} else {
		state="idle";
		image_index=facing;
	}
	
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
	//pushee = noone;
	if place_meeting(x+(_r-_l)*wlk_spd,y,box) || place_meeting(x+(_r-_l)*wlk_spd,y,playable) && (_r||_l)
	{
		//change to pushing
		sprite_index=push_spr;
		image_index=7+wlk_cycle;
		xstop=(_r-_l)*wlk_spd;
		state="pushing";
		pushee = instance_place(x+(_r-_l)*wlk_spd,y,box);
		if pushee != noone && pushee.move == true
		{
			pushee.x+=(_r-_l)*wlk_spd;
			//move the object 16 px away
		}
	}

	if place_meeting(x,y+(_d-_u)*wlk_spd,box) || place_meeting(x,y+(_d-_u)*wlk_spd,playable) && (_d||_u)
	{
		//change to pushing
		sprite_index=push_spr;
		image_index=1+(_u*3)+wlk_cycle;
		ystop=(_d-_u)*wlk_spd;
		state="pushing";
	}
}
//move player
x+=(_r-_l)*wlk_spd-xstop;
y+=(_d-_u)*wlk_spd-ystop;