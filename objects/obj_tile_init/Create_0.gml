/// @description Tile setup
#macro TILE_SIZE 32

tile_columns = sprite_get_width(spr_collision) / TILE_SIZE;
tile_rows = sprite_get_height(spr_collision) / TILE_SIZE;

num_heights = (tile_columns * TILE_SIZE) * tile_rows;

global.heights[num_heights - 1] = 0;