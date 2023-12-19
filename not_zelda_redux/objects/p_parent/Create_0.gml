image_speed = 0;
hp = 11;
hp_max = 12; //max health 4 to a heart container
facing = 0; //facing 0down 1up 2left 3right
last_face = facing

frame = 0; //what frame of an animation the character is in
frame_count = 0;
frame_delay = 15; //number of gameloops before advancing a frame in animation
frame_max = 4; //should replace with an array of what each state maxes out at

left = false;
right = false;
down = false;
up = false;
a = false;
b = false;
x_dir = 0;
y_dir = 0;
spd = 2;
	
function check_input() {
	left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	up = keyboard_check(vk_up) || keyboard_check(ord("W"));
		
	a = keyboard_check(ord("Z"));
	b = keyboard_check(ord("X"));
}
	
function empty_input() {
	left = false;
	right = false;
	down = false;
	up = false;
	a = false;
	b = false;
}





