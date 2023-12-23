///@description move an object 16 pixles either horrozontally or vertially
function slide_object(obj, dir) {

	//var obj = argument0; //object to move
	//var dir = argument1; //direction to move

	var unit=16;
	var x_dir=0;
	var y_dir=0;

	switch dir
	{
		case 0: x_dir=0; y_dir=1; break;
		case 1: x_dir=0; y_dir=-1; break;
		case 2: x_dir=1; y_dir=0; break;
		case 3: x_dir=-1; y_dir=0; break;
	}

	obj.push_x_dest=obj.x+unit*x_dir;
	obj.push_y_dest=obj.y+unit*y_dir;




}
