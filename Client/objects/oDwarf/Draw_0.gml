/// @description 
event_inherited();

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
	//if (hspeed > 0) sprite_index = sBlue_Right;
	//else if (hspeed < 0) sprite_index = sBlue_Left;
	//else if (vspeed < 0) sprite_index = sBlue_Up;
	//else sprite_index = sBlue_Down;
	//image_xscale = 1;
}
else
{
	sprite_index = spr_Dwarf_Idle;
	//sprite_index = sBlue_Standing;
	//if (x < mController.mPointerX) image_xscale = 1;
	//else image_xscale = -1;
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
