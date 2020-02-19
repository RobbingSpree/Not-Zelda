/// @description setup active player

//set current view
//cam = camera_create_view(sword.x-64,sword.y-64,128,128,0,sword,-1,-1,32,32);
target=1;
first_frame = true;
camera_set_view_target(view_camera[0],sword);
update_state(sword);

target_x=0;
target_y=0;

//set up unlocked players
players = [];
players[1,0]=sword; //character object name
players[1,1]=true; //unlocked flag
players[1,2]=false; //holding down a switch offscreen flag
players[2,0]=dancer;
players[2,1]=true;
players[2,2]=false;
players[3,0]=singer;
players[3,1]=true;
players[3,2]=false;
players[4,0]=princess;
players[4,1]=true;
players[4,2]=false;

spd=10;
view_camera[0] = camera_create_view(0,0,160,160,0,-1,-1,-1,0,0);
steps = 2;
debug = steps;
