/// @description Insert description here
// You can write your code in this editor
show = false;
image_speed = 0;
cursor_memory = false;

invin_x = 0;
invin_y = 0;

menu_screen = "invintory";

i = []; //invintory list
for (var j=0; j<8; j++)
	for (var k=0; k<6; k++)
	{
		i[j,k] = item.none;
	}
i[0,0]=item.sword;
i[0,1]=item.power_b;

e = []; //what's equipped to all characters
for (var j=0; j<4; j++)
	for (var k=0; k<2; k++)
	{
		e[j,k] = item.none;
	}
e[0,0]=item.sword;
e[0,1]=item.power_b;

enum item 
{
	none,
	sword,
	power_b
}