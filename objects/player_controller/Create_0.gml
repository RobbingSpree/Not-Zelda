/// @description setup active player

//set current view
//cam = camera_create_view(sword.x-64,sword.y-64,128,128,0,sword,-1,-1,32,32);
target=1;
camera_set_view_target(view_camera[0],sword);
update_state(sword);