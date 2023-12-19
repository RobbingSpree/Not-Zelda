
check_input();

x_dir = right - left;
y_dir = down - up;

#region facing and animation

if left || right 
{
	facing=3-left;
}
if up || down 
{
	facing=1-down;	
}
last_face=facing;
image_index = facing*4+frame;

frame_count++

if ((left+right+up+down) == 0) {
	frame_count = 0;
	frame = 0;
} else {
	if frame_count >= frame_delay {
		frame++
		frame_count = 0;
	}
	if frame >= frame_max
		frame = 0;

}

#endregion

move_and_collide(x_dir*spd,y_dir*spd,wall);