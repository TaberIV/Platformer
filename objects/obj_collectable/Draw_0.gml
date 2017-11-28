/// @description Draw self

if (view_current < global.num_players and !collected[view_current])
	draw_sprite(sprite_index, -1, x, y + cos(theta));