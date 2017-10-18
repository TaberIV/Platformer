///@description Kills player and makes new instance at start of level

audio_play_sound(snd_die, 1, false);

// Reset values
x = xstart;
y = ystart;

velocity = [0, 0];

draw_dir = 1;

if (instance_exists(obj_coin))
	obj_coin.collected[playerNum] = false;