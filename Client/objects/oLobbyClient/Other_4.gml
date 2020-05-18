/// @description oLobbyClient->RoomStart

if(mIsAuth)
{
	if(room == rmSplash)
	{
		// Enable Online mode
		with(oMenuSplash)
		{
			mButtonOnline.mIsEnabled = true;
		}
	}
	
	/*switch(room)
	{
		case rm_Dashboard:
			var _getDashboard = Lobby_SerializeGetDashboard();
			SendPacket(_getDashboard);
			buffer_delete(_getDashboard);
			
			x = oDashboardMenu.x;
			y = oDashboardMenu.y;
			if(mFriendList == noone) mFriendList = instance_create_layer(x, y + 256, "Instances", oFriendsList);
			if(mMessageList == noone) mMessageList = instance_create_layer(x, y + 368, "Instances", oMessageList);
			if(mLobbyList == noone) mLobbyList = instance_create_layer(0, 0, "Instances", oLobbyList);
			
			break;
		case rm_Profile:
			var _getDashboard = Lobby_SerializeGetDashboard();
			SendPacket(_getDashboard);
			buffer_delete(_getDashboard);
			if(mFriendList == noone) mFriendList = instance_create_layer(x, y + 256, "Instances", oFriendsList);
			if(mMessageList == noone) mMessageList = instance_create_layer(x, y + 368, "Instances", oMessageList);
			break;
		case rm_BattleReport:
			var _getNextBattleReport = Lobby_SerializeGetNextBattleReport();
			SendPacket(_getNextBattleReport);
			buffer_delete(_getNextBattleReport);
			break;
		case rm_Award:
			var _getNextAward = Lobby_SerializeGetNextAward();
			SendPacket(_getNextAward);
			buffer_delete(_getNextAward);
			break;
	}*/
}
else
{
	if(room != rmSplash) room_goto(rmSplash);
}
