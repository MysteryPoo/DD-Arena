/// @description Insert description here
// You can write your code in this editor
if (mIsMoving)
{
	sprite_index = spr_DwarfWalk;
}
else
{
	sprite_index = spr_Dwarf_Idle;
}
draw_self();

if (noone != mBomb && instance_exists(mBomb))
{
	var distance = min(point_distance(x, y, mController.mPointerX, mController.mPointerY), 512);
	var angle = point_direction(x, y, mController.mPointerX, mController.mPointerY);
	var _x = x + lengthdir_x(distance, angle);
	var _y = y + lengthdir_y(distance, angle);
	draw_circle_color(_x, _y, 32, mController.image_blend, mController.image_blend, false);
}
