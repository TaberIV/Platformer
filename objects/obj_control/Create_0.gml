///@description Initialize globals

global.debug = false;
global.view_width = 960;
global.view_height = 540;
global.font = "Fonts/Helvetica-Regular.ttf";

play_room = false;
global.pause = false;

global.num_players = 4;
global.draw_colors = [c_red, c_blue, c_yellow, c_green];
global.keyboardPlayer = 1;
global.winner = -1;

#macro NONE 0
#macro HORIZONTAL 1
#macro VERTICAL 2
#macro QUADRANT 3
split_screen = NONE;