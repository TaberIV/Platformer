///@description Adds gravity to player y speed

//Controls variable jump height
if (velocity[1] < 0 and !jumpDown)
	fallGrav = true;
else if (velocity[1] >= 0 or grounded or wallRide or (jumpDown and !fallGrav))
	fallGrav = false;

//Adds gravity force
if (!fallGrav)
	velocity[1] += grav * global.delta;
else
	velocity[1] += 3 * grav * global.delta;