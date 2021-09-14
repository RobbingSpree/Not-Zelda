function update_state(playing) {

	sword.state="absent";
	//dancer.state="absent";
	//singer.state="absent";
	//princess.state="absent";

	playing.state="idle";


}

function return_to_idle() {
	state = "idle";
	sprite_index = walk_spr[facing];
	image_index = 0;
}

function unsafe_slide() {
	var x_last = x;
	var y_last = y;
	//slide towards center of tile that is unsafe
	x = lerp(x,x-cell_mod_x+sprite_get_xoffset(walk_spr[facing]),0.3);
	y = lerp(y,y-cell_mod_y+sprite_get_yoffset(walk_spr[facing]),0.3);
	//check if sliding is done and swap to falling state
	if abs(x - x_last) < 1 && abs(y - y_last) < 1 {
		state = "falling";
		sprite_index = fall_spr;
		image_index = 0;
		ani = 0;
	}
}

function throw_object(missle, dir, xx, yy) {
	var mis = instance_create_layer(xx,yy,"Instances",thrownable);
	mis.facing = dir;
	mis.parent = missle;
	return_to_idle();
}

function use_item(item_name) {
	image_index = 0;
	switch item_name {
		case "sword": sprite_index=item_swing_spr[facing]; break;
	}
}

function player_state(state) {
	
}