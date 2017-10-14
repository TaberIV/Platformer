///@description Initialize constants
count = 0;
//Controls
gamepad_set_axis_deadzone(0, 0.3);
dir = 0;
forwardPressed = 0;

#region Movement
control = true;

velocity = [0, 0];
velocityfloats = [0, 0];

#region Walking
walkForce = .75;
friction_ = 0.2;
walkSpeed = 3;
runSpeed = 6;
sprintSpeed = 10;
#endregion

#region Jump and gravity
airMobility = 0.7;
grounded = false;

var jumpHeight = 128 + 10;
var jumpWidth = 512;

jumpSpeed = -2 * jumpHeight * sprintSpeed / (jumpWidth / 2);
grav = 2 * jumpHeight * sqr(sprintSpeed) / sqr(jumpWidth / 2);
fallGrav = false;
#endregion

#region Wall ride
wallRideSpeed = 5;
unstickTime = 5;
unstickCounter = unstickTime;
#endregion
#endregion

#region Tile info

//Collisions
var layer_id = layer_get_id("tile_collision");
tile_collisions_map_id = layer_tilemap_get_id(layer_id);

//Hazards
layer_id = layer_get_id("tile_hazard");
tile_hazard_map_id = layer_tilemap_get_id(layer_id);
#endregion

//Draw info
draw_dir = 1;
draw_color = c_white;