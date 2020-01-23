var nearbys = argument0;

var dist = 8;//wlk_spd*3;

//check left
if place_meeting(x-dist,y,box) || place_meeting(x-dist,y,playable)
{
	nearbys[3,1] = instance_place(x-dist,y,box);
	if nearbys[3,1] == noone
		nearbys[3,1] = instance_place(x-dist,y,playable);
	nearbys[3,0] = true;
	nearbys[3,2] = distance_to_object(nearbys[3,1]);
} else {	
	nearbys[3,0] = false;
	nearbys[3,1] = noone;
	nearbys[3,2] = dist;
}	

//check right
if place_meeting(x+dist,y,box) || place_meeting(x+dist,y,playable)
{
	nearbys[2,1] = instance_place(x+dist,y,box);
	if nearbys[2,1] == noone
		nearbys[2,1] = instance_place(x+dist,y,playable);
	nearbys[2,0] = true;
	nearbys[2,2] = distance_to_object(nearbys[2 ,1]);
} else {	
	nearbys[2,0] = false;
	nearbys[2,1] = noone;
	nearbys[2,2] = dist;
}	

//check up
if place_meeting(x,y-dist,box) || place_meeting(x,y-dist,playable)
{
	nearbys[1,1] = instance_place(x,y-dist,box);
	if nearbys[1,1] == noone
		nearbys[1,1] = instance_place(x,y-dist,playable);
	nearbys[1,0] = true;
	nearbys[1,2] = distance_to_object(nearbys[1,1]);
} else {
	nearbys[1,0] = false;
	nearbys[1,1] = noone;
	nearbys[1,2] = dist;
}	

//check down
if place_meeting(x,y+dist,box) || place_meeting(x,y+dist,playable)
{
	nearbys[0,1] = instance_place(x,y+dist,box);
	if nearbys[0,1] == noone
		nearbys[0,1] = instance_place(x,y+dist,playable);
	nearbys[0,0] = true;
	nearbys[0,2] = distance_to_object(nearbys[0,1]);
} else {
	nearbys[0,0] = false;
	nearbys[0,1] = noone;
	nearbys[0,2] = dist;
}	

return nearbys;