function push_space_free(dir) {
	//check 2 grid spaces ahead of the player for obsticles
	//return true for free space and flase for occupied space
	//var dir = argument0;

	if adjacent[facing,1] != noone
	{
		switch dir
		{
			case 0: if !place_meeting(x,y+unit*2,box) return true; break;
			case 1: if !place_meeting(x,adjacent[facing,1].y-unit,box) return true; break;
			case 2: if !place_meeting(x+unit*2,y,box) return true; break;
			case 3: if !place_meeting(adjacent[facing,1].x-unit,y,box) return true; break;
		}
		return false;
	} else 
		return true;
	/*
	0=down
	1=up
	2=right
	3=left
	*/
}
