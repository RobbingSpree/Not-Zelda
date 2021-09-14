/// @description setup active player

//set current view
//cam = camera_create_view(sword.x-64,sword.y-64,128,128,0,sword,-1,-1,32,32);
target=1;
first_frame = true;
camera_set_view_target(view_camera[0],sword);
update_state(sword);

screen_w = 1080
screen_h = 1080
if room == Room0 {
	screen_w = 160
	screen_h = 160	
}

target_x=0;
target_y=0;

//set up unlocked players
players = [];
players[1,0]=sword; //character object name
players[1,1]=true; //unlocked flag
players[1,2]=false; //holding down a switch offscreen flag
players[2,0]=dancer;
players[2,1]=false;
players[2,2]=false;
players[3,0]=singer;
players[3,1]=false;
players[3,2]=false;
players[4,0]=princess;
players[4,1]=false;
players[4,2]=false;

spd=108;
view_camera[0] = camera_create_view(0,0,screen_w,screen_h,0,-1,-1,-1,0,0);
steps = 2;
debug = steps;

//setup collision based on tiles
//taken from https://forum.yoyogames.com/index.php?threads/creating-objects-from-the-tile-layer.63000/
/*
var lay_id = layer_get_id("Ground_details");
var map_id = layer_tilemap_get_id(lay_id);
var grid_unit = 16;

for (var xx = 0; xx < room_width; xx += grid_unit)
{
    for (var yy = 0; yy < room_height; yy += grid_unit)
    {
        if (tilemap_get_at_pixel(map_id, xx, yy) != 0)
        {
            instance_create_layer(xx, yy, "Instances", wall);
        }
    }
}
*/
var lay_id = layer_get_id("Ground_details");
var map_id = layer_tilemap_get_id(lay_id);
var grid_unit = 108;
if room == Room0
	grid_unit = 16
var has_adjacent = false;
var strip_count = 0;
var curr_tile, next_tile, strip_start_xx;
var xx = 0;
var yy = 0;

while (yy < room_height)
{
    while (xx < room_width)
    {
        curr_tile = tilemap_get_at_pixel(map_id, xx, yy);
        next_tile = tilemap_get_at_pixel(map_id, xx + grid_unit, yy);
        
        if (curr_tile != 0 && next_tile == 0)
        {
            instance_create_layer(xx, yy, "Instances", wall);
        }
        else if (curr_tile != 0 && next_tile != 0)
        {
            has_adjacent = true;
            strip_start_xx = xx;
            strip_count++;
        }
        
        while (has_adjacent)
        {
            xx += grid_unit;
            strip_count++;
            
            if (xx + grid_unit < room_width)
            {
                next_tile = tilemap_get_at_pixel(map_id, xx + grid_unit, yy);
            }
            
            if (next_tile == 0)
            {
                has_adjacent = false;
                var inst = instance_create_layer(strip_start_xx, yy, "Instances", wall);
                inst.image_xscale = strip_count;
                strip_count = 0;
            }
        }
        xx += grid_unit;   
    }
    xx = 0;
    yy += grid_unit;
}
