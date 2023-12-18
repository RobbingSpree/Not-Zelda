image_speed = 0;


function controls() constructor{
	left = false;
	right = false;
	down = false;
	up = false;
	a = false;
	b = false;
	
	function check_input() {
		left = keyboard_check(vk_left);
		right = keyboard_check(vk_left);
		down = keyboard_check(vk_left);
		up = keyboard_check(vk_left);
		
		a = keyboard_check(vk_left);
		b = keyboard_check(vk_left);
	}
	
	function empty_input() {
		left = false;
		right = false;
		down = false;
		up = false;
		a = false;
		b = false;
	}
}


input = new controls();



