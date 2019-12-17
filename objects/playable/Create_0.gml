/// @description setup playable parent
player_index=0;
image_speed=0;
state="idle";
h=11;
max_h=12;
wlk_spd=1;
wlk_cycle=1;
facing=0; //facing 0down 1up 2left 3right
last_face=0;
ani=0;
ani_spd=10;

walk_spr = lionk;
push_spr = link_push;
lift_spr = link_carry;
move=true;
lift=true;

draw_set_font(defont);