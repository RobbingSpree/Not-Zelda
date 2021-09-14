//check for state end

if state == "action" {
	state = "idle";
	sprite_index = walk_spr[facing];
}

if state == "falling" {
	state = "idle";
	sprite_index = walk_spr[facing];
	x = last_valid_x+unit/2;
	y = last_valid_y+unit/2;
}

image_index=0;
ani = 0;

