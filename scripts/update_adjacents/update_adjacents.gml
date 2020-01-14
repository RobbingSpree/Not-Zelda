var nearbys = argument0;

//check left
if place_meeting(x-wlk_spd,y,box)
{
	nearbys[2,1] = instance_place(x-wlk_spd,y,box);
	nearbys[2,0] = true;
	nearbys[2,2] = distance_to_object(nearbys[2,1]);
} else nearbys[2,0] = false;

//check right
if place_meeting(x+wlk_spd,y,box)
{
	nearbys[3,1] = instance_place(x+wlk_spd,y,box);
	nearbys[3,0] = true;
	nearbys[3,2] = distance_to_object(nearbys[3,1]);
} else nearbys[3,0] = false;

//check up
if place_meeting(x,y-wlk_spd,box)
{
	nearbys[1,1] = instance_place(x,y-wlk_spd,box);
	nearbys[1,0] = true;
	nearbys[1,2] = distance_to_object(nearbys[1,1]);
} else nearbys[1,0] = false;

//check down
if place_meeting(x,y+wlk_spd,box)
{
	nearbys[0,1] = instance_place(x,y+wlk_spd,box);
	nearbys[0,0] = true;
	nearbys[0,2] = distance_to_object(nearbys[0,1]);
} else nearbys[0,0] = false;

return nearbys;