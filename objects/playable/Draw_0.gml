/// @description draw the character and debug values
//debug
if debug_flag {
	draw_set_color(c_red);
	draw_rectangle(last_valid_x,last_valid_y,last_valid_x+unit,last_valid_y+unit,false);
	draw_set_color(-1);
}
draw_self();
if liftee != noone {
	draw_sprite(liftee.sprite_index,liftee.image_index,x,y-unit);
	var h_spd = 0;
	var v_spd = 0;
	switch facing {
		case d.down:	v_spd = 1; break;
		case d.up:		v_spd = -1; break;
		case d.right:	h_spd = 1; break;
		case d.left:	h_spd = -1; break;
	}
	draw_sprite(ground_target_spr,0,x+throw_dist*h_spd,y+throw_dist*v_spd);
}

//debug
var d_unit = 50;
if debug_flag {
	draw_text(x,y-3*d_unit,cell_mod_x);
	draw_text(x,y-4*d_unit,cell_mod_y);
	draw_text(x,y+d_unit,state);
	if closest_hole != noone {
		draw_text(x,y-60,point_distance(x,y,closest_hole.x+8,closest_hole.y+8));
		draw_line_width(x,y,closest_hole.x+8,closest_hole.y+8,5);
	}
	
	draw_set_halign(fa_center);
	if action_buildup>action_threshold
		draw_set_colour(c_red);
	//draw_text(x-20,y-40,last_valid_x);
	//draw_text(x-20,y+10,last_valid_y);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	
	
	if state == "pushing" {
		draw_text(x-50,y-80,push_x_dest);
		draw_text(x-30,y-80,x);
		draw_text(x-50,y-70,push_y_dest);
		draw_text(x-30,y-70,y);
		draw_set_colour(c_red);
		draw_line(x,y,push_x_dest,push_y_dest);
		draw_set_color(c_white);
	}
	
	if state == "lifting" {
		draw_text(x-50,y-80,action_comedown);
	}
	
	
	//collision debug	
	var offset = d_unit;
	draw_text(x-offset,y,adjacent[3,2]);
	draw_text(x+offset,y,adjacent[2,2]);
	draw_text(x,y-offset,adjacent[1,2]);
	draw_text(x,y,adjacent[0,2]);
	
	for (i=0; i<4; i++) {
		if adjacent[i,1] != noone
			draw_line_width(x,y,adjacent[i,1].x,adjacent[i,1].y,5);
	}
}