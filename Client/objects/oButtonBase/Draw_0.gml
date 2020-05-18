/// @description 
draw_self();
//draw_set_font(fnt_Farkle);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed_color(x + 2,
							y + 2,
							mText,
							image_xscale,
							image_yscale,
							image_angle,
							c_black,
							c_black,
							c_black,
							c_black,
							image_alpha);
draw_text_transformed_color(x,
							y,
							mText,
							image_xscale,
							image_yscale,
							image_angle,
							image_blend,
							image_blend,
							image_blend,
							image_blend,
							image_alpha);
