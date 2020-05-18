/// @description Handle Ping
/// @arg0 data

show_debug_message("PING");
var _ping = Lobby_DeserializePing(argument0);
show_debug_message("Pong: " + string(current_time));
mPing = current_time - _ping[?"time"];
show_debug_message("Latency: " + string(mPing));
ds_map_destroy(_ping);
		