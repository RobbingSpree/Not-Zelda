switch facing {
	case d.down:	v_spd = spd; break;
	case d.up:		v_spd = -spd; break;
	case d.right:	h_spd = spd; break;
	case d.left:	h_spd = -spd; break;
}

//attempt to pre-solve parabolic flight
if frames_till_ground < 0 {
	for (var i=0; i<30; i++) {
		var h = height;
		h = grav_spd - grav*i;
		if h <= 0 {
			frames_till_ground = i;
			break;
		}
	}
	//check for collisions in path now we know how long the item will stay airborn
	var dist = frames_till_ground/10;
	var lim = 10;
	for (var k=0; k<lim; k++) {
		if position_meeting(x+dist*h_spd,y+dist*v_spd,box) {
			frames_till_collide = k;
			break;
		} else {
			dist = frames_till_ground/lim*k;
		}
	}
}
count++;
if frames_till_collide = count {
	h_spd = 0;
	v_spd = 0;
}

/*
if height_last > height  && abs(height_last-height) > abs(8*grav) {
	//look for children of box collisions to hit
	if position_meeting(x+h_spd,y+v_spd,box) {
		//deal dmg to both objects and set spd to 0 if unbroken
		h_spd = 0;
		v_spd = 0;
	}
	//look for children of playable to catch
	if position_meeting(x+h_spd,y+v_spd,playable) {
		//set character to carry state and update who's holding parent object
		
	}
}
*/

height_last = height;
if height > 0 {
	x+=h_spd;
	y+=v_spd;
	height += grav_spd; 
	grav_spd += grav;
	//put in check for object collisions
} else {
	if parent.breaks {
		parent.x = x;
		parent.y = y;
		instance_destroy(self);
	} else {
		parent.x = x;
		parent.y = y;
		instance_destroy(self);		
	}
}
