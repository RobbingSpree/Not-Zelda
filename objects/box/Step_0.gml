/// @description Insert description here
// You can write your code in this editor
if lift && lifted
{
	mask_index = noone;
	sprite_yoffset=-16;
}

if lift && !lifted
{
	mask_index = mask;
	sprite_yoffset=0;
}