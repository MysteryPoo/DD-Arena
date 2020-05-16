/// @description Process Local Input
with (mControllers[0])
{
	mIsPrimaryAction = mouse_check_button(mb_left);
	mIsSecondaryAction = mouse_check_button(mb_right);
	mIsUp = keyboard_check(ord("W"));
	mIsDown = keyboard_check(ord("S"));
	mIsLeft = keyboard_check(ord("A"));
	mIsRight = keyboard_check(ord("D"));
	mPointerX = mouse_x;
	mPointerY = mouse_y;
}
