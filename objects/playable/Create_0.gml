/// @description setup playable parent
player_index=0;
image_speed=0;
state="idle";
h=11;
unit = 16;
max_h=12;

//animation variables
wlk_spd=1;
wlk_cycle=1;
facing=0; //facing 0down 1up 2left 3right
last_face=0;
ani=0;
ani_spd=10;
action_buildup = 0;
action_threshold = 15;

//action variables


//collision details
adjacent = [];
push_x_dest=-1;
push_y_dest=-1;

//animation defaults
walk_spr = lionk;
push_spr = link_push;
pushee=noone;
lift_spr = link_carry;
mask_index=lionk;

//physics flags
move=true;
lift=true;

//set up adjacency tabel
for (var i=0; i<4; i++)
{
	adjacent[i,0]=false; // is something within 16 pixles of the player
	adjacent[i,1]=noone; // what instance is it
	adjacent[i,2]=-1; //distance to that object or -1
}	

//debug
draw_set_font(defont);