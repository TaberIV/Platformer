/// @description Sets delta time

global.delta = 60 * ((using_delta) ? delta_time / 1000000 : 1 / game_get_speed(gamespeed_fps));