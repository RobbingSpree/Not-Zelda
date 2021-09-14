/// @description character specific setup
event_inherited();

player_index=4;
walk_spr = [zorlda_d,zorlda_u,zorlda_r,zorlda_l];
push_spr = [prin_push_d,prin_push_u,prin_push_r,prin_push_l];
lift_spr = [prin_lift_d,prin_lift_u,prin_lift_r,prin_lift_l];
carry_spr = [prin_carry_d,prin_carry_u,prin_carry_r,prin_carry_l];
fall_spr = prin_fall;
item_swing_spr = [link_equip_action_d,link_equip_action_u,link_equip_action_r,link_equip_action_l];
action_a_spr = item_swing_spr;
action_b_spr = lift_spr;

equip_a = "magic";
equip_b = "thurmaturgy";