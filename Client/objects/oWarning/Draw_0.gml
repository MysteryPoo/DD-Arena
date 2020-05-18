/// @description oMessage->Draw

draw_self();

draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_text_ext_color(x + 2, y + 2, string_upper(mMessage), 32, 600, c_black, c_black, c_black, c_black, mTextAlpha);
draw_text_ext_color(x, y, string_upper(mMessage), 32, 600, c_white, c_white, c_gray, c_gray, mTextAlpha);
