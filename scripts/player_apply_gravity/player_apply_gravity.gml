///@description Adds gravity to player y speed

//Controls variable jump height
if (velocity_[1] < 0 and !jumpDown)
	fallGrav = true;
else if (velocity_[1] >= 0 or grounded or wallRide or (jumpDown and !fallGrav))
	fallGrav = false;

//Adds gravity force
if (!fallGrav)
	velocity_[1] += grav;
else
	velocity_[1] += 3 * grav;