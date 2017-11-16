///@description Adds gravity to player y speed

//Adds gravity force
velocity[1] += grav * (fallGrav ? 3 : 1);