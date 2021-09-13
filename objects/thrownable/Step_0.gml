switch facing {
	case 0: v_spd = spd; break;
	case 1: v_spd = -spd; break;
	case 2: h_spd = spd; break;
	case 3: h_spd = -spd; break;
}

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