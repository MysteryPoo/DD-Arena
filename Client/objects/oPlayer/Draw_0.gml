/// @description 

if (mBombCount == 0)
{
	draw_set_color(c_red);
	draw_set_alpha(0.5);
	draw_sprite(spr_Bomb, 0, x, y - 32);
	draw_set_alpha(1);
	draw_set_color(c_white);
}

if (mIsMoving)
{
	sprite_index = spr_DwarfWalk;
}
else
{
	sprite_index = spr_Dwarf_Idle;
}
draw_self();

// Draw range
if (noone != mBomb && instance_exists(mBomb))
{
	var distance = min(point_distance(x, y, mController.mPointerX, mController.mPointerY), mThrowRange);
	var angle = point_direction(x, y, mController.mPointerX, mController.mPointerY);
	var _x = x + lengthdir_x(distance, angle);
	var _y = y + lengthdir_y(distance, angle);
	draw_set_alpha(0.3);
	draw_circle_color(_x, _y, 32, mController.image_blend, mController.image_blend, false);
	draw_set_alpha(1);
}
