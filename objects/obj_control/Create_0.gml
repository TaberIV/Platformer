///@description Initialize globals
// DEBUG
global.debug = false;

// Game Control
play_room = false;
global.pause = false;

// Player Control
global.num_players = 2;
global.draw_colors = [c_red, c_blue, c_yellow, c_green];
global.keyboardPlayer = 1;
global.winner = -1;

// View info
global.view_width = 960;
global.view_height = 540;
#macro NONE 0
#macro HORIZONTAL 1
#macro VERTICAL 2
#macro QUADRANT 3
global.split_screen = NONE;

// Style info
global.font = "Fonts/Helvetica-Regular.ttf";
scale = 1;
fnt_win = font_add(global.font, 36 * scale, false, false, 32, 128);