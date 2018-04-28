///@description Proccesses movement based on state

// Proccesses movement based on state
switch (state) {
	case states.finished:
		player_finished();
	case states.normal:
		player_normal();
		break;
	case states.wallRide:
		player_wallRide();
		break;
}


if (state != states.finished)
	global.playerTimers[playerNum]++;