/// @description Draw the hearts UI

var loops = 0;
var xx = x-4*round(max_h/4);
var yy = y-24;
if player_controller.target=player_index
	for (var c_h = 0; c_h<max_h; c_h+=4;)
	{
		var t_h =h-c_h;
		if h-4>c_h
			draw_sprite(hearts_ui,4,xx+8*loops,yy-8);	
		else if t_h>0
			if t_h mod 4 != 0
				draw_sprite(hearts_ui,t_h mod 4,xx+8*loops,yy-8);
			else
				draw_sprite(hearts_ui,4,xx+8*loops,yy-8);
		else 
			draw_sprite(hearts_ui,0,xx+8*loops,yy-8);
		loops+=1;
	
	} 