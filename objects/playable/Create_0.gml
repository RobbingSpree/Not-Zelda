/// @description setup playable parent
player_index=0;
image_speed=0;
state="idle";
h=11; //current health
unit = 108; //distance unit used in programming
max_h=12;//max health 4 points per heart

//animation variables
wlk_spd=4; //pixles per frame moved while moving
facing=0; //facing 0down 1up 2left 3right
last_face=0; //direction faces last frame
ani=0; //animation slowdown feature
ani_spd=15; //frames per animation index advancement
action_buildup = 0; //used for walking to push and opening locked doors
action_threshold = 15; //threshold above variable is compaired against currently equals 0.25 seconds
action_comedown = 0;
action_timers=[];
action_timer_setup();


//debug 
if room == Room0 {
	image_xscale = 0.15
	image_yscale = 0.15
	wlk_spd = 1;
}

//action variables
control_lock = 0;
camera_move = true;
steps=0;
last_valid_x = ((floor(x/unit))*unit);
last_valid_y = ((floor(y/unit))*unit);
xslide = 0;
yslide = 0;

//collision details
adjacent = [];
push_x_dest=-1;
push_y_dest=-1;
//tilemap = layer_tilemap_get_id("Ground_details");

//animation defaults
enum d {
	down,
	up,
	right,
	left
}
walk_spr = [lionk_d,lionk_u,lionk_r,lionk_l];
push_spr = [link_push_d,link_push_u,link_push_r,link_push_l];
pushee=noone;
lift_spr = [link_lift_d,link_lift_u,link_lift_r,link_lift_l];
carry_spr = [link_carry_d,link_carry_u,link_carry_r,link_carry_l];
liftee=noone;
fall_spr = link_fall;
item_swing_spr = [link_equip_action_d,link_equip_action_u,link_equip_action_r,link_equip_action_l];
action_a_spr = item_swing_spr;
action_b_spr = item_swing_spr;
equip_a = "sword";
equip_b = "sword";
action_timers = [];
action_timer_setup();

mask_index=all_char;

//physics flags
move=true;
lift=true;
unsafe = false;
airborn = false;
cell_mod_x = 0;
cell_mod_y = 0;
closest_hole = noone;

//set up adjacency tabel
enum adj {
	flag,
	whois,
	dist
}
for (var i=0; i<4; i++)
{
	adjacent[i,adj.flag]=false; // is something within 16 pixles of the player
	adjacent[i,adj.whois]=noone; // what instance is it
	adjacent[i,adj.dist]=-1; //distance to that object or -1
}	

//debug
draw_set_font(defont);
debug_flag = false;