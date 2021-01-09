function sliding(obj, spd) {
	//move an object 1 px toward destination
	//var obj = argument0;
	var xx=obj.x;
	var yy=obj.y;
	var dx=obj.push_x_dest;
	var dy=obj.push_y_dest;
	//var spd=argument1;

	if xx==dx //either already at destination or moving vertically
	{
		var dir = sign(dy-yy);
		obj.y+=dir*spd;
	}

	if yy==dy//either already at destination or moving horozontally
	{
		var dir = sign(dx-xx);
		obj.x+=dir*spd;
	}


}
