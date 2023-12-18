input.empty_input();
input.check_input();

var x_dir = input.left - input.right;
var y_dir = input.down - input.up;
var spd = 5;

move_and_collide(x_dir*spd,y_dir*spd,wall);