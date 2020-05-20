/// @description 
// This is hacky
var _x = [-8, 8, 0, -10, 6];
var _y = [-8, -8, 0, 8, 8];

for (var i = 0; i < mStackSize; ++i)
{
	if (i < 5)
	{
		draw_sprite(sprite_index, image_index, x + _x[i], y + _y[i]);
	}
	else
	{
		draw_sprite(sprite_index, image_index, x, y);
	}
}
