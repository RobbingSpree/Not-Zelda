/// @description character specific setup
event_inherited();

player_index=1;
walk_spr = [bread_walk_d,bread_walk_u,bread_walk_r,bread_walk_l];
push_spr = [link_push_d,link_push_u,link_push_r,link_push_l];
lift_spr = [link_lift_d,link_lift_u,link_lift_r,link_lift_l];
carry_spr = [link_carry_d,link_carry_u,link_carry_r,link_carry_l];
fall_spr = link_fall;
item_swing_spr = [link_equip_action_d,link_equip_action_u,link_equip_action_r,link_equip_action_l];
action_a_spr = item_swing_spr;
action_b_spr = lift_spr;

equip_a = "sword";
equip_b = "glove";

