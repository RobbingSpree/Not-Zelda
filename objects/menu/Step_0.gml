//update ui position

x=player_controller.x;
y=player_controller.y;

//work around for ui overlapping with character 
var py = player_controller.players[player_controller.target,0].y;
if py mod 160 < 60
	y=player_controller.y+130;