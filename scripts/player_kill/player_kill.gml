///@description Kills player and makes new instance at start of level

audio_play_sound(snd_die, 1, false);

x = obj_player_spawn.x;
y = obj_player_spawn.y;

velocity = [0, 0];