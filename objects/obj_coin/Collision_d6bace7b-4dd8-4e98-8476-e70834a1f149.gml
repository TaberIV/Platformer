/// @description Play sound then destroy self

if (!collected[other.playerNum]) {
	audio_play_sound(snd_coin, 1, false);
	collected[other.playerNum] = true;
}