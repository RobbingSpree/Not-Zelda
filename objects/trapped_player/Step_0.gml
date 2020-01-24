/// @description 

hvr += dir;

if dir < 0 && hvr < hvr_min //going down
{
	dir = 0.25;
} 
if dir > 0 && hvr > hvr_max
{
	dir = -0.25;
}

pause +=1;
if pause >= pause_max
{
	image_speed = 1;
	if image_index >= 5.75
	{
		pause = 0;
		image_index=0;
		image_speed = 0;
	}
}