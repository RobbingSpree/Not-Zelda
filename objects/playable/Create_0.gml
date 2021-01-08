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
ani_spd=15;
action_buildup = 0;
action_threshold = 15;
action_comedown = 0;
action_timers=[];
action_timer_setup();

//action variables
control_lock = 0;
camera_move = true;
steps=0;
steps_end = 2;

//collision details
adjacent = [];
push_x_dest=-1;
push_y_dest=-1;
lifting=noone;
//tilemap = layer_tilemap_get_id("Ground_details");

//animation defaults
walk_spr = lionk;
push_spr = link_push;
pushee=noone;
lift_spr = link_carry;
action_a_spr = link_equip_action;
action_b_spr = link_equip_action;
equip_a = "sword";
equip_b = "sword";

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