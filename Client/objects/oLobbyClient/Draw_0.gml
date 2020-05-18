/// @description oLobbyClient->Draw
draw_self();
draw_set_color(c_white);
if(mPing > -1)
{
	draw_text(100, 100, "Ping: " + string(mPing));
}
