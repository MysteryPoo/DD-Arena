/// @description Ping

alarm[0] = room_speed;

if(!mIsConnected)
{
	/*if(instance_exists(oGameSettings))
	{
		mServerIP = oGameSettings.mIP;
		mServerPort = oGameSettings.mPort;
		mToken = oGameSettings.mToken;
		//instance_destroy(oGameSettings);
	}*/
	mSocketRef = network_create_socket(network_socket_tcp);
	network_set_config(network_config_use_non_blocking_socket, 1);
	if(network_connect_raw(mSocketRef, mServerIP, mServerPort) > -1)
	{
		mIsConnected = true;
	}
	exit;
}

var _request = Client_SerializePing();
var _success = SendPacket(_request);
buffer_delete(_request);
if(!_success)
{
	mIsConnected = false;
	if(!mRetryFlag)
	{
		var _warning = instance_create_layer(room_width * 0.5, room_height * 0.5, "PopUp", oWarning);
		_warning.mMessage = "Lost connection to game server!";
		alarm[1] = room_speed * 2;
		alarm[0] = -1;
	}
	mRetryFlag = false;
}
else
{
	mRetryFlag = true;
}
