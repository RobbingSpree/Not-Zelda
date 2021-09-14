/// @description character specific setup
event_inherited();

player_index=3;
walk_spr = [naru_d,naru_u,naru_r,naru_l];
push_spr = [naru_push_d,naru_push_u,naru_push_r,naru_push_l];
lift_spr = [naru_lift_d,naru_lift_u,naru_lift_r,naru_lift_l];
carry_spr = [naru_carry_d,naru_carry_u,naru_carry_r,naru_carry_l];
fall_spr = naru_fall;
item_swing_spr = [link_equip_action_d,link_equip_action_u,link_equip_action_r,link_equip_action_l];
action_a_spr = item_swing_spr;
action_b_spr = lift_spr;

equip_a = "sing";
equip_b = "empty";