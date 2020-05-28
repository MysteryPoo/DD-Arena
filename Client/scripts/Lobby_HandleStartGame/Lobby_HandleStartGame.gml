/// @description Lobby_HandleStartGame

show_debug_message("STARTGAME");
var _response = Lobby_DeserializeStartGame(argument0);
				
var _success = false;
if(_response[?"port"] == 0 && _response[?"token"] == 0)
{
	var _error = _response[?"domain"];
	with(mLobbyListRef)
		mError = _error;
}
else
{
	if (!instance_exists(oGameSettings)) {
		show_debug_message("Some went wrong. Missing oGameSettings.");
		instance_create_layer(0, 0, "Instances", oGameSettings);
	}
	oGameSettings.mIP = _response[?"domain"];
	oGameSettings.mPort = _response[?"port"];
	oGameSettings.mToken = _response[?"token"];
	show_debug_message("domain: " + _response[?"domain"]);
	show_debug_message("port: " + string(_response[?"port"]));
	_success = true;
}
				
ds_map_destroy(_response);
				
if(_success) room_goto(rmOnline);
