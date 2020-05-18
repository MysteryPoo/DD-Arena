/// @description oLobbyClient->Dialog

if(async_load[?"id"] == mAsyncNewUsername)
{
	if(async_load[?"status"])
	{
		if(async_load[?"result"] != "" && string_length(async_load[?"result"]) > 3)
		{
			mAsyncNewUsername = -1;
			mUsername = async_load[?"result"];
			ini_open("account.ini");
			ini_write_string("Account", "username", mUsername);
			ini_close();
			//with(oLobbyClient)
			{
				var _accountInfo = ds_map_create();
				_accountInfo[?"username"] = mUsername;
				var _username = Lobby_SerializeAccountInfo(_accountInfo);
				SendPacket(_username);
				buffer_delete(_username);
				ds_map_destroy(_accountInfo);
			}
		}
		else
		{
			mAsyncNewUsername = get_string_async("Choose a name", "");
		}
	}
	else
	{
		mAsyncNewUsername = get_string_async("Choose a name", "");
	}
}
