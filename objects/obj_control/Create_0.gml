///@description Initialize globals

global.debug = false;
global.view_width = room_width;
global.view_height = room_height;
global.font = "Fonts/Helvetica-Regular.ttf";

// Delta time info
using_delta = true;
//game_set_speed((using_delta) ? 999 : 60, gamespeed_fps);

// Camera and menu
play_room = false;