/// @description Insert description here
// You can write your code in this editor

if show == true
{
	image_index = 0;
	draw_self();
	var start_x = x+16;
	var start_y = y+52;
	
	for (var j=0; j<8; j++)
		for (var k=0; k<6; k++)
		{
			var cont = i[j,k];
			if cont != item.none
				draw_sprite(menu_items_spr,cont,start_x+j*16,start_y+k*16);
		}
	draw_sprite(selector_spr,0,start_x+invin_x*16,start_y+invin_y*16);
	
	var _a = e[player_controller.target-1,0];
	var _b = e[player_controller.target-1,1];
	draw_sprite(menu_items_spr,_a,x+22,y+6); //draw equipped items on a
	draw_sprite(menu_items_spr,_b,x+70,y+6); //draw equipped items on b
	draw_sprite(all_char,player_controller.target-1,x+145,y+23); //draw current character
}

if show == false
{
	image_index = 1;
	draw_self();
	var _a = e[player_controller.target-1,0];
	var _b = e[player_controller.target-1,1];
	draw_sprite(menu_items_spr,_a,x+22,y+6); //draw equipped items on a
	draw_sprite(menu_items_spr,_b,x+70,y+6); //draw equipped items on b
	draw_sprite(all_char,player_controller.target-1,x+145,y+23); //draw current character
}