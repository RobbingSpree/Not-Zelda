/// @description poll input and detect surroundings

//movement input
_l = keyboard_check(vk_left) || keyboard_check(ord("A"));
_r = keyboard_check(vk_right) || keyboard_check(ord("D"));
_d = keyboard_check(vk_down) || keyboard_check(ord("S"));
_u = keyboard_check(vk_up) || keyboard_check(ord("W"));
//menu input //menu input looks for key presses rather then direction held
_ml = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
_mr = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
_md = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
_mu = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
//action input
_a = keyboard_check_pressed(ord("Z"));
_b = keyboard_check_pressed(ord("X"));
//pause button
_pause = keyboard_check_pressed(vk_enter);
//debug toggle
_debug = keyboard_check_pressed(vk_control);
debug_flag = (keyboard_check_pressed(vk_escape) ? !debug_flag : debug_flag);
if keyboard_check_pressed(vk_backspace) room_restart();
xslide=0;
yslide=0;

//check for nearby holes
closest_hole = instance_nth_nearest(x,y,hole,1);
cell_mod_x = x mod unit;
cell_mod_y = y mod unit;
var x_edge = false;
var y_edge = false;
if cell_mod_x <= unit/4 or cell_mod_x >= unit/4*3
	x_edge = true;
if cell_mod_y <= unit/4 or cell_mod_y >= unit/4*3
	y_edge = true;
unsafe = false;
if ((floor(x/unit))*unit) != last_valid_x || ((floor(y/unit))*unit) != last_valid_y{
	unsafe = true;
}

if control_lock > 0
{
	control_lock -=1;
	if camera_move
	{
		var _spd = wlk_spd/2;
		switch facing
		{
			case d.down: y+=_spd; break;
			case d.up: y-=_spd; break;
			case d.right: x+=_spd; break;
			case d.left: x-=_spd; break;
		}
	}
}
if control_lock < 0
	control_lock = 0;

if _pause
{
	if state == "menu"
	{
		state = "idle";
		menu.show = false;
	} else
	{
		state = "menu";
		menu.show = true;
	}
}

#region Menu controller
if state == "menu"
{
	//detect input
	if _ml
		menu.invin_x -= 1;
	if _mr
		menu.invin_x += 1;
	if _mu
		menu.invin_y -= 1;
	if _md
		menu.invin_y += 1;
	//fix wrap around
	if menu.invin_x < 0
		menu.invin_x = 7;
	if menu.invin_x > 7
		menu.invin_x = 0;
	if menu.invin_y < 0
		menu.invin_y = 5;
	if menu.invin_y > 5
		menu.invin_y = 0;
	//bind input to changes
	if _a
	{
		equip_a = menu.i[menu.invin_x,menu.invin_y];
		menu.e[player_index-1,0] = equip_a;
	}
	if _b
	{
		equip_b = menu.i[menu.invin_x,menu.invin_y];
		menu.e[player_index-1,1] = equip_b;
	}
}
#endregion