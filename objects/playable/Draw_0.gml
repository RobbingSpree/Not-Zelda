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
if action_buildup>action_threshold
	draw_set_colour(c_red);
draw_text(x,y-40,action_buildup);
draw_set_halign(fa_left);
draw_set_color(c_white);

if state == "pushing"
{
	draw_text(x-50,y-80,push_x_dest);
	draw_text(x-30,y-80,x);
	draw_text(x-50,y-70,push_y_dest);
	draw_text(x-30,y-70,y);
	draw_set_colour(c_red);
	draw_line(x,y,push_x_dest,push_y_dest);
	draw_set_color(c_white);
}
//collision debug
/*

var offset = 8;
draw_text(x-offset,y,adjacent[3,2]);
draw_text(x+offset,y,adjacent[2,2]);
draw_text(x,y-offset,adjacent[1,2]);
draw_text(x,y,adjacent[0,2]);

for (i=0; i<4; i++)
{
	if adjacent[i,1] != noone
		draw_line(x,y,adjacent[i,1].x,adjacent[i,1].y);
}
*/