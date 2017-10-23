///@description Initialize globals
// DEBUG
global.debug = false;

// Game Control
play_room = false;
global.pause = false;

// Player Control
global.num_players = 3;
global.draw_colors = [c_red, c_blue, c_yellow, c_green];
global.keyboardPlayer = 1;
global.winner = -1;

// Style info
global.font = "Fonts/Helvetica-Regular.ttf";

// View info
var aspect_ratio = display_get_width() / display_get_height();
var ideal_view_width = 960;
var ideal_view_height = 540;

global.view_height = ideal_view_height;
global.view_width = round(ideal_view_height * aspect_ratio);

#macro NONE 0
#macro HORIZONTAL 1
#macro VERTICAL 2
#macro QUADRANT 3
global.split_screen = NONE;