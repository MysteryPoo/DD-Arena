/// @description oLobbyClient->Alarm0

// Reset ping alarm
alarm[0] = room_speed * 5;

if(!mIsConnected)
{
	if(os_browser == browser_not_a_browser)
	{
		mSocketRef = network_create_socket(network_socket_tcp);
		if(network_connect_raw(mSocketRef, mServerIP, mServerPort) > -1)
		{
			mIsConnected = true;
		}
		exit;
	}
}

var _paramsMap = ds_map_create();
_paramsMap[?"time"] = current_time;
show_debug_message("Ping: " + string(current_time));
var _ping = Lobby_SerializePing(_paramsMap);
if(!SendPacket(_ping))
{
	mIsConnected = false;
	mIsAuth = false;
	mIsInLobby = false;
	with(oMenuSplash)
	{
		if(mButtonOnline != noone)
		{
			mButtonOnline.mIsFading = true;
			mButtonOnline = noone;
		}
	}
	if(mMessageListRef != noone && instance_exists(mMessageListRef))
	{
		instance_destroy(mMessageListRef);
		mMessageListRef = noone;
	}
	if(mFriendListRef != noone && instance_exists(mFriendListRef))
	{
		instance_destroy(mFriendListRef);
		mFriendListRef = noone;
	}
	if(os_browser == browser_not_a_browser)
	{
		network_destroy(mSocketRef);
	}
	mSocketRef = -1;
	var _warning = instance_create_layer(room_width * 0.5, room_height * 0.5, "PopUp", oWarning);
	_warning.mMessage = string_upper("Lost connection to matchmaking server.");
	_warning.mNavId = rmSplash;
}
ds_map_destroy(_paramsMap);
