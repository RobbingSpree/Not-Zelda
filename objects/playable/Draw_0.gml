/// @description draw the character and UI

draw_self();

var loops = 0;
var xx = x-4*round(max_h/4);
var yy = y-24;
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

//debug
draw_set_halign(fa_center);
draw_text(x,y-40,pushee);
draw_set_halign(fa_left);

draw_text(x-sprite_width,y,adjacent[2,2]);
draw_text(x+sprite_width,y,adjacent[3,2]);
draw_text(x,y-sprite_width,adjacent[0,2]);
draw_text(x,y+sprite_width,adjacent[1,2]);