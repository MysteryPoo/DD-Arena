/// @description Handle Handshake
/// @arg0 data
show_debug_message("HANDSHAKE");
var _response = Lobby_DeserializeHandshake(argument0);
				
mId = _response[?"id"];
mDeviceUUID = _response[?"device_uuid"];
mUsername = _response[?"username"];
mLastLogin = _response[?"last_login"];
				
if(mId == "0" && mDeviceUUID == "0" && mLastLogin == "0")
{
	// Invalid login
	mError = mUsername; // Using the username slot to contain the error message
	var _error = instance_create_layer(room_width * 0.5, room_height * 0.5, "PopUp", oWarning);
	_error.mMessage = mError;
	if(string_lower(mError) == "account does not exist.")
	{
		ini_open("account.ini");
		ini_write_string("Account", "id", "0");
		ini_write_string("Account", "username", "");
		ini_close();
	}
	exit;
}
				
ini_open("account.ini");
ini_write_string("Account", "id", mId);
ini_write_string("Account", "password", mPassword);
ini_write_string("Account", "device_uuid", mDeviceUUID);
ini_write_string("Account", "username", mUsername);
ini_write_string("Account", "last_login", mLastLogin);
ini_close();
// Username
var testString = string_copy(mUsername, 0, 7);
if(string_lower(testString) == "newuser")
{
	mAsyncNewUsername = get_string_async("Choose a name", "");
}
else
{
	// Enable Online mode
	with(oMenuSplash)
	{
		mButtonOnline.mIsEnabled = true;
	}
				
	ds_map_destroy(_response);
				
	mIsAuth = true;
}
