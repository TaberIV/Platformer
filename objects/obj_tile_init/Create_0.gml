/// @description Tile setup
#macro TILE_SIZE 32

tile_columns = sprite_get_width(spr_collision) / TILE_SIZE;
tile_rows = sprite_get_height(spr_collision) / TILE_SIZE;
tile_num = tile_columns * tile_rows;

// Stores how far from the top of the tile the 
// highest pixel is in every pixel column
global.heights[tile_num * TILE_SIZE] = 0;