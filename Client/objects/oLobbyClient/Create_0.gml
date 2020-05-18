/// @description oLobbyClient->Create

enum LOBBY
{
	CHALLENGE,
	HANDSHAKE,
	PING,
	MESSAGEINFO,
	NEWLOBBY,
	LOBBYDATA,
	STARTGAME,
	JOINLOBBY,
	GETFRIENDS,
	ACCOUNTINFO,
	FRIENDINFO,
	GETMESSAGES,
	SETMESSAGE,
	USERSEARCH,
	LOBBYPLAYER,
	GETDASHBOARD,
	GETNEXTBATTLEREPORT,
	GETPUBLICPLAYERINFO,
	GETAVATARLIST,
	ACQUIREAVATAR,
	SETAVATAR,
	GETNEXTAWARD,
	GETDICELIST,
	ACQUIREDICE,
	SETDICE
};

// Read in cached account information
ini_open("account.ini");
mId = ini_read_string("Account", "id", "0");
mPassword = ini_read_string("Account", "password", "abcdefg");
mDeviceUUID = ini_read_string("Account", "device_uuid", "0");
mUsername = ini_read_string("Account", "username", "UNKNOWN");
mLastLogin = ini_read_string("Account", "last_login", "NEVER");
ini_close();

alarm[0] = 1; // Start the ping alarm

if(os_browser == browser_not_a_browser)
{
	network_set_config(network_config_use_non_blocking_socket, 1);
}
