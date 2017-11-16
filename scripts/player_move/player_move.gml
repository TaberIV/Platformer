/// @description Move player

//Reapply floats
velocity[0] += velocityfloats[0];
velocity[1] += velocityfloats[1];

//Floor speed and keep remaining float separate
velocityfloats[0] = velocity[0] - (floor(abs(velocity[0]) * sign(velocity[0])));
velocityfloats[1] = velocity[1] - (floor(abs(velocity[1]) * sign(velocity[1])));
velocity[0] -= velocityfloats[0];
velocity[1] -= velocityfloats[1];

tile_collision_move(tile_collisions_map_id, velocity);
