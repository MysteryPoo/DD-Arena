/// @description Draw
draw_self();
var percent = mFuse / mMaxFuse * 100;
draw_healthbar(x - 32, y - 32, x + 32, y - 16, percent, c_gray, c_red, c_green, 0, true, true);
