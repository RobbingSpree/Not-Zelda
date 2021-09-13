//check for state end

if state == "action" {
	state = "idle";
	sprite_index = walk_spr;
}

if state == "falling" {
	state = "idle";
	sprite_index = walk_spr;
	x = last_valid_x+unit/2;
	y = last_valid_y+unit/2;
}

image_index=facing;
ani = 0;

