/// @description update state and move character

if state == "idle"
{
	if control_lock == 0
	{
		camera_move = false;
		if _r || _l || _u || _d //read input
			state = "walking";
		if _a || _b {
			if _a && equip_a != "empty"
				state = "action";
			if _b && equip_b != "empty"
				state = "action";
		}		
	} 
	if unsafe && !airborn
		unsafe_slide();
}

if state == "falling" {
	sprite_index = fall_spr;
	ani +=1;
	x = lerp(x,x-cell_mod_x+sprite_get_xoffset(walk_spr[facing]),0.05);
	y = lerp(y,y-cell_mod_y+sprite_get_yoffset(walk_spr[facing]),0.05);
	if ani == ani_spd {
		ani = 0;
		image_index += 1;
	}
}

if state == "walking"
{
	state = "idle";
	sprite_index = walk_spr[facing];
	
	#region Input
	if _r || _l || _u || _d //read input
	{
		state="walking";
		ani +=1;
		if ani == ani_spd //allow game to run at a higher speed than the animation
		{
			//update animation
			image_index+=1;
			ani=0;
		}
		//check for nearby objects
		adjacent = update_adjacents(adjacent);
		//check for hazzards
		if unsafe && !airborn
			unsafe_slide();
	} 
	if _a || _b {
			if _a && equip_a != "empty" {
				state = "action";
				ani = 0;
			}
			if _b && equip_b != "empty" {
				state = "action";
				ani = 0;
			}
	}
	if _debug {
		if liftee == noone 
			state = "lifting";
		else {
			throw_object(liftee,facing,x,y);
			liftee = noone;
		}
	}
	#endregion

	#region facing update

	if _l || _r 
	{
		facing=3-_r;
	}
	if _u || _d 
	{
		facing=1-_d;	
	}
	last_face=facing;
	#endregion
	
	#region Start Pushing
	var free = push_space_free(facing)
	if action_buildup>action_threshold && free && state != "pushing"
	{
		if adjacent[facing,adj.whois] != noone && adjacent[facing,adj.whois].move==true //if running into a moveable object for last 16 frames
		{
			slide_object(self,facing);
			slide_object(adjacent[facing,adj.whois],facing);
			pushee=adjacent[facing,adj.whois];
			state = "pushing";
			sprite_index = push_spr[facing];
			image_index = 0;
			ani=0;
		} 
		
	}
	if !free 
		action_buildup=0;
	#endregion
	
	#region Collision and movement
	var can_move = false;
	var dist = wlk_spd;
	if _d && (adjacent[d.down,adj.dist] == -1 || adjacent[d.down,adj.dist] > wlk_spd) {
		can_move = true;
		dist = min(wlk_spd,adjacent[d.down,adj.dist]);
		y+=(_d-_u)*dist;
		action_buildup=0;
	}
	if _u && (adjacent[d.up,adj.dist] == -1 || adjacent[d.up,adj.dist] > wlk_spd) {
		can_move = true;
		dist = min(wlk_spd,adjacent[d.up,adj.dist]);
		y+=(_d-_u)*dist;
		action_buildup=0;
	}
	if _r && (adjacent[d.right,adj.dist] == -1 || adjacent[d.right,adj.dist] > wlk_spd) {
		can_move = true;
		dist = min(wlk_spd,adjacent[d.right,adj.dist]);
		x+=(_r-_l)*dist;
		action_buildup=0;
	}
	if _l && (adjacent[d.left,adj.dist] == -1 || adjacent[d.left,adj.dist] > wlk_spd) {
		can_move = true;
		dist = min(wlk_spd,adjacent[d.left,adj.dist]);
		x+=(_r-_l)*dist;
		action_buildup=0;
	}
		
	if can_move{
		//update last valid square
		var next_valid_x = ((floor(x/unit))*unit);
		var next_valid_y = ((floor(y/unit))*unit);
		if !position_meeting(next_valid_x,next_valid_y,hole) { //check if next cell has a hazzard in it
			last_valid_x = next_valid_x;
			last_valid_y = next_valid_y;
		}
	} else {
		action_buildup+=1;
	}
	
	#endregion
	
}

if state == "action"
{
	#region Animate
	ani +=1;
	if ani == ani_spd //allow game to run at a higher speed than the animation
	{
		steps+=1;
		ani=0;
		image_index++
	}
	if _b //prioritize B presses over A
	{
		use_item(equip_b);
	} else if _a
	{
		use_item(equip_a);
	}
	#endregion
}

if state == "pushing"
{
	//if you have arrived at your destination
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
		sprite_index = walk_spr[facing];
		image_index=0;
		adjacent=update_adjacents(adjacent);
	} else {//keep arms and ears inside the vehicle while object is in motion
		sliding(self,wlk_spd/2);
		//update last valid square
		var next_valid_x = ((floor(x/unit))*unit);
		var next_valid_y = ((floor(y/unit))*unit);
		if !position_meeting(next_valid_x,next_valid_y,hole) { //check if next cell has a hazzard in it
			last_valid_x = next_valid_x;
			last_valid_y = next_valid_y;
		}
		if pushee != noone {
			var p_spd = wlk_spd/2
			with pushee
			{
				sliding(self,p_spd);	
			}
		}
		//apply animation
		ani +=1;
		if ani == ani_spd //allow game to run at a higher speed than the animation
		{
			image_index += 1;
			ani=0;
		}

	}
}

if state == "lifting"
{
	//attempt to pickup
	if adjacent[facing,adj.flag] && adjacent[facing,adj.dist] < 4 {
		if adjacent[facing,adj.whois].lift { //can be lifted
			//lift object
			liftee = adjacent[facing,adj.whois];
			//hide lifted object offscreen
			liftee.x = -1000
			liftee.y = -1000
		} else {
			state = "idle";
			action_comedown  = 0;
		}
	} else { 
		state = "idle";
		action_comedown  = 0;
	}
	state = "idle";
	action_comedown  = 0;
	ani = 0;
	
	//return to walking with lift flag on
}

depth = -y;