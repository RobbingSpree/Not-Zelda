/// @description 
event_inherited();
//inherited values
move=true;
lift=true;
lifted = false;
in_use=false;
breaks = false;

//animation values
index = 1;
image_speed = 0;
pause = 20;
pause_max=120;
hvr = 0;
dir=1;
hvr_max = 4;
hvr_min = -4;
inside = noone;

switch index
{
	case 0: inside = all_char_v2; image_index = 0; break; //sword
	case 1: inside = all_char_v2; image_index = 1; break; //dancer
	case 2: inside = all_char_v2; image_index = 2; break; //singer
	case 3: inside = all_char_v2; image_index = 3; break; //princess
}
	