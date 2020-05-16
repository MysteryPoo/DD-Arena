/// @description Debug Data

// Mouse Position
draw_circle_color(mPointerX, mPointerY, 32, image_blend, image_blend, false);
// LMB
draw_circle_color(mPointerX - 10, mPointerY, 8, c_white, c_white, !mIsPrimaryAction);
// RMB
draw_circle_color(mPointerX + 10, mPointerY, 8, c_white, c_white, !mIsSecondaryAction);

// Directions
draw_circle_color(mPointerX, mPointerY - 32, 8, image_blend, image_blend, !mIsUp);
draw_circle_color(mPointerX, mPointerY + 32, 8, image_blend, image_blend, !mIsDown);
draw_circle_color(mPointerX - 32, mPointerY, 8, image_blend, image_blend, !mIsLeft);
draw_circle_color(mPointerX + 32, mPointerY, 8, image_blend, image_blend, !mIsRight);