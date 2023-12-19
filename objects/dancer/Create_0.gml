/// @description character specific setup
event_inherited();

player_index=2;
walk_spr = [din_d,din_u,din_r,din_l];
push_spr = [din_push_d,din_push_u,din_push_r,din_push_l];
lift_spr = [din_lift_d,din_lift_u,din_lift_r,din_lift_l];
carry_spr = [din_carry_d,din_carry_u,din_carry_r,din_carry_l];
fall_spr = din_fall;
item_swing_spr = [din_dance,din_dance,din_dance,din_dance];
action_a_spr = item_swing_spr;
action_b_spr = lift_spr;

equip_a = "dance";
equip_b = "jump";