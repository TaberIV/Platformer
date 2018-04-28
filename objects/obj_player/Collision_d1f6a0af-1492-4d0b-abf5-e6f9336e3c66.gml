/// @description Collect coins and powerups

if (!other.collected[playerNum]) {
	other.collected[playerNum] = true;
	var pickup_sound = snd_coin;
	
	switch (other.object_index) {
		case obj_coin:
			coins_collected += 1;
			pickup_sound = snd_coin;
			win_condition = true;
			break;
		case obj_powerup_jump:
			doubleJump = true;
			doubleJumpCharge = true;
			break;
	}
	
	audio_play_sound(pickup_sound, 1, false);
}