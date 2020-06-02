/// @description Lobby_ProcessPacket
/// @arg0 command
/// @arg1 commandSize
/// @arg2 data

switch(argument0)
{
	case LOBBY.CHALLENGE:
		Lobby_HandleChallenge(argument2);
		break;
	case LOBBY.HANDSHAKE:
		Lobby_HandleHandshake(argument2);
		break;
	case LOBBY.GETPUBLICPLAYERINFO:
		Lobby_HandleGetPublicPlayerInfo(argument2);
		break;
	case LOBBY.PING:
		Lobby_HandlePing(argument2);
		break;
	case LOBBY.STARTGAME:
		Lobby_HandleStartGame(argument2);
		break;
	/*case LOBBY.FRIENDINFO:
	show_debug_message("FRIENDINFO");
		var _friendInfo = Lobby_DeserializeFriendInfo(argument2);
		with(mFriendList)
		{
			var _friend = noone;
			var _listSize = ds_list_size(mList);
			var _friendIndex = -1;
			for(var i = 0; i < _listSize; ++i)
			{
				if(mList[|i].mId == _friendInfo[?"id"])
				{
					_friend = mList[|i];
					_friendIndex = i;
					break;
				}
			}
			if(_friend != noone)
			{
				_friend.isOnline = _friendInfo[?"online"];
				if(_friendInfo[?"remove"])
				{
					instance_destroy(_friend);
					ds_map_delete(mList, _friendIndex);
				}
			}
			else
			{
				_friend = instance_create_layer(0, 0, "Instances", oFriend);
				_friend.mId = _friendInfo[?"id"];
				_friend.isOnline = _friendInfo[?"online"];
				ds_list_add(mList, _friend);
				mMaxValue = _listSize + 1; // Probably could remove this and just calculate on the fly when needed
			}
		}
		break;
	case LOBBY.MESSAGEINFO:
	show_debug_message("MESSAGEINFO");
		var _messageInfo = Lobby_DeserializeMessageInfo(argument2);
				
		with(mMessageList)
		{
			var _message = noone;
			var _listSize = ds_list_size(mList);
			for(var i = 0; i < _listSize; ++i)
			{
				if(mList[|i].mId == _messageInfo[?"id"])
				{
					_message = mList[|i];
					break;
				}
			}
			if(_message != noone)
			{
				// Messages don't update 
			}
			else
			{
				_message = instance_create_layer(0, 0, "Instances", oMessage);
				_message.mId = _messageInfo[?"id"];
				_message.mSender = _messageInfo[?"sender"];
				_message.mSenderName = _messageInfo[?"senderName"];
				_message.mSubject = _messageInfo[?"subject"];
				_message.mMessage = _messageInfo[?"message"];
				_message.isNew = _messageInfo[?"isNew"];
				ds_list_add(mList, _message);
				mMaxValue = _listSize + 1; // Probably could remove this and just calculate on the fly when needed
				if(_message.isNew)
				{
					var _notification = instance_create_layer(room_width, 128, "PopUp", oLobbyNotification);
					_notification.mMessage = _message.mSubject;
				}
			}
		}
		break;
	case LOBBY.LOBBYDATA:
	show_debug_message("LOBBYDATA");
		var _lobbyData = Lobby_DeserializeLobbyData(argument2);
				
		inLobby = true;
				
		var _isLeader = false;
		with(mLobbyList)
		{
			var _lobbySize = _lobbyData[?"lobbySize"];
						
			mMaxPlayers = _lobbyData[?"maxPlayers"];
			isPublic = _lobbyData[?"isPublic"];
					
			var _listSize = ds_list_size(mPlayerList);
			while(_listSize > _lobbySize)
			{
				instance_destroy(mPlayerList[|(_listSize - 1)]);
				ds_list_delete(mPlayerList, _listSize - 1);
				_listSize = ds_list_size(mPlayerList);
			}
		}
				
		with(oDashboardMenu)
		{
			if(_lobbyData[?"isPublic"])
			{
				mPrivateButton.mText = "PUBLIC";
			}
			else
			{
				mPrivateButton.mText = "PRIVATE";
			}
			mPrivateButton.isEnabled = true;
					
					
			var _plusButton = _lobbyData[?"maxPlayers"] < 4;
			var _minusButton = _lobbyData[?"maxPlayers"] > 2 && _lobbyData[?"maxPlayers"] > _lobbyData[?"lobbySize"];
			if(_plusButton)
			{
				if(mPlusButton == noone)
				{
					mPlusButton = instance_create_layer(mPlusButtonX, mPlusButtonY, "Instances", oButtonZoom);
					mPlusButton.sprite_index = sPlus;
				}
				else
				{
					mPlusButton.isEnabled = true;
				}
			}
			else
			{
				if(mPlusButton != noone)
				{
					mPlusButton.isFading = true;
					mPlusButton = noone;
				}
			}
			if(_minusButton)
			{
				if(mMinusButton == noone)
				{
					mMinusButton = instance_create_layer(mMinusButtonX, mMinusButtonY, "Instances", oButtonZoom);
					mMinusButton.sprite_index = sMinus;
				}
				else
				{
					mMinusButton.isEnabled = true;
				}
			}
			else
			{
				if(mMinusButton != noone)
				{
					mMinusButton.isFading = true;
					mMinusButton = noone;
				}
			}
		}
				
		ds_map_destroy(_lobbyData);
		break;
	case LOBBY.LOBBYPLAYER:
	show_debug_message("LOBBYPLAYER");
		var _lobbyPlayer = Lobby_DeserializeLobbyPlayer(argument2);
				
		with(mLobbyList)
		{
			while(ds_list_size(mPlayerList) < _lobbyPlayer[?"index"] + 1)
			{
				var _x = mPlayerPositionX[_lobbyPlayer[?"index"]];
				var _y = mPlayerPositionY[_lobbyPlayer[?"index"]];
				ds_list_add(mPlayerList, instance_create_layer(_x, _y, "Instances", oLobbyUser));
			}
			var _player = mPlayerList[|_lobbyPlayer[?"index"]];
			_player.mIndex = _lobbyPlayer[?"index"];
			_player.mId = _lobbyPlayer[?"id"];
			_player.isReady = _lobbyPlayer[?"isReady"];
			// Invalidate in case we are overwriting
			_player.mPlayerInfo = -1;
			_player.mAvatarSprite = -1;
			_player.isLoaded = false;
					
			var _allReady = true;
			for(var i = 0; i < ds_list_size(mPlayerList); ++i)
			{
				if(mPlayerList[|i].isReady == false) _allReady = false;
			}
			if(oDashboardMenu.mStartGameButton != noone)
			{
				if(_allReady)
				{
					oDashboardMenu.mStartGameButton.mText = "START";
				}
				else
				{
					oDashboardMenu.mStartGameButton.mText = "READY";
				}
				oDashboardMenu.mStartGameButton.isEnabled = true;
			}
		}
				
		ds_map_destroy(_lobbyPlayer);
		break;
	case LOBBY.JOINLOBBY:
	show_debug_message("JOINLOBBY");
		var _joinLobby = Lobby_DeserializeJoinLobby(argument2);
		show_debug_message(_joinLobby[?"error"]);
		var _error = instance_create_layer(room_width * 0.5, room_height * 0.5, "Instances", oWarning);
		_error.mMessage = _joinLobby[?"error"];
		ds_map_destroy(_joinLobby);
		break;
	case LOBBY.USERSEARCH:
	show_debug_message("USERSEARCH");
		var _userSearch = Lobby_DeserializeUserSearch(argument2);
				
		if(ds_list_size(_userSearch) == 0)
		{
			var _warning = instance_create_layer(room_width * 0.5, room_height * 0.5, "PopUp", oWarning);
			_warning.mMessage = "No results found.";
		}
		else
		{
			with(mFriendList)
			{
				var _listSize = ds_list_size(mSearchList);
				for(var i = 0; i < _listSize; ++i)
				{
					instance_destroy(mSearchList);
				}
				for(var j = 0; j < ds_list_size(_userSearch); ++j) 
				{
					var _isAlreadyFriend = false;
					if(oLobbyClient.mId == _userSearch[|j])
					{
						_isAlreadyFriend = true;
					}
					for(var i = 0; i < ds_list_size(mList); ++i)
					{
						if(mList[|i].mId == _userSearch[|j])
						{
							_isAlreadyFriend = true;
							break;
						}
					}
					if(!_isAlreadyFriend)
					{
						var _user = instance_create_layer(0, 0, "Instances", oUser);
						_user.mId = _userSearch[|j];
						_user.isFriend = _isAlreadyFriend;
						ds_list_add(mSearchList, _user);
					}
				}
			}
		}
		ds_list_destroy(_userSearch);
		break;
	case LOBBY.PING:
	
		break;
	case LOBBY.GETDASHBOARD:
	show_debug_message("GETDASHBOARD");
		var _dashboard = Lobby_DeserializeGetDashboard(argument2);
		if(room == rm_Dashboard)
		{
			oDashboardMenu.mPlayerCount.mValue = _dashboard[?"onlinePlayers"];
					
			if(_dashboard[?"pendingBattleReports"]) room_goto(rm_BattleReport);
			else if(_dashboard[?"pendingAwards"]) room_goto(rm_Award);
		}
		if(room == rm_Profile)
		{
			oProfileMenu.mCredits.mValue = _dashboard[?"credits"];
		}
		ds_map_destroy(_dashboard);
		break;
	case LOBBY.GETNEXTBATTLEREPORT:
	show_debug_message("GETNEXTBATTLEREPORT");
		var battleReport = Lobby_DeserializeGetNextBattleReport(argument2);
		var playerList = battleReport[?"playerList"];
		var trophyList = battleReport[?"trophyList"];
		if(room == rm_BattleReport)
		{
			if(battleReport[?"winnerId"] == "0")
			{
				room_goto(rm_Dashboard);
			}
			else
			{
				oBattleReportMenu.isLoaded = true;
				if(battleReport[?"winnerId"] == oLobbyClient.mId)
				{
					oBattleReportMenu.mWinner = true;
				}
				for(var i = 0; i < ds_list_size(playerList); ++i)
				{
					var template = oBattleReportMenu.mPlayerTemplate[|i];
					var player = playerList[|i];
					var _x = template[?"x"];
					var _y = template[?"y"];
					var playerInst = instance_create_layer(_x, _y, "Instances", oLobbyUser);
					playerInst.mId = player[?"id"];
					var _xScore = template[?"scoreX"];
					var _yScore = template[?"scoreY"];
					var _score = instance_create_layer(_xScore, _yScore, "Instances", oNumber);
					_score.mValue = player[?"score"];
				}
				var trophyInstList = ds_list_create();
				for(var i = 0; i < ds_list_size(trophyList); ++i)
				{
					var trophyCount = trophyList[|i];
					if(trophyCount > 0)
					{
						var trophy = instance_create_layer(oBattleReportMenu.mTrophyCenterX, oBattleReportMenu.mTrophyCenterY, "Instances", oTrophy);
						trophy.mValue = trophyCount;
						trophy.mType = i;
						ds_list_add(trophyInstList, trophy);
					}
				}
				var _rows = ceil(ds_list_size(trophyInstList) / 5);
				var _y = oBattleReportMenu.mTrophyCenterY - (_rows - 1) * 0.5 * (sprite_get_height(sTrophy) + 42);
				var _trophyIndex = 0;
				for(var j = 0; j < _rows; ++j)
				{
					var startIndex = 5 * j;
					var _cols = min(5, ds_list_size(trophyInstList) - startIndex);
					var _x = oBattleReportMenu.mTrophyCenterX - (_cols - 1) * 0.5 * (sprite_get_width(sTrophy) + 15);
					for(var i = 0; i < _cols; ++i)
					{
						var _xx = _x + i * (sprite_get_width(sTrophy) + 15);
						var _yy = _y + j * (sprite_get_height(sTrophy) + 42);
						trophyInstList[|_trophyIndex].mTargetX = _xx;
						trophyInstList[|_trophyIndex++].mTargetY = _yy;
					}
				}
				ds_list_destroy(trophyInstList);
			}
		}
		// Cleanup
		for(var i = 0; i < ds_list_size(playerList);++i)
		{
			var player = playerList[|i];
			ds_map_destroy(player);
		}
		ds_list_destroy(playerList);
		ds_list_destroy(trophyList);
		break;
	case LOBBY.GETPUBLICPLAYERINFO:
	show_debug_message("GETPUBLICPLAYERINFO");
		var getPublicPlayerInfo = Lobby_DeserializeGetPublicPlayerInfo(argument2);
		var _id = getPublicPlayerInfo[?"id"];
		if(-1 == oPlayerCache.mCache[?_id])
		{
			// Do not destroy getPublicPlayerInfo here
			oPlayerCache.mCache[?_id] = getPublicPlayerInfo;
		}
		else
		{
			// Assuming the server forced an update of the cache
			ds_map_destroy(oPlayerCache.mCache[?_id]);
			oPlayerCache.mCache[?_id] = getPublicPlayerInfo;
			// Invalidate cache for user in lobby
			with(oLobbyUser)
			{
				if(mId == _id)
				{
					mPlayerInfo = -1;
					mAvatarSprite = -1;
					mDiceSprite = -1;
					isLoaded = false;
				}
			}
			// Invalidate friend
			with(oFriend)
			{
				if(mId == _id)
				{
					mPlayerInfo = -1;
					mAvatarSprite = -1;
					mDiceSprite = -1;
					isLoaded = false;
				}
			}
			// Invalidate generic user
			with(oUser)
			{
				if(mId == _id)
				{
					mPlayerInfo = -1;
					mAvatarSprite = -1;
					mDiceSprite = -1;
					isLoaded = false;
				}
			}
		}
		break;
	case LOBBY.GETAVATARLIST:
		var avatarList = Lobby_DeserializeGetAvatarList(argument2);
		if(rm_Profile == room)
		{
			for(var i = 0; i < ds_list_size(oAvatarList.mList); ++i)
			{
				instance_destroy(oAvatarList.mList[|i]);
			}
			ds_list_clear(oAvatarList.mList);
			for(var i = 0; i < ds_list_size(avatarList); ++i)
			{
				var avatarInfo = avatarList[|i];
				var avatarItem = instance_create_layer(oAvatarList.x - room_width, oAvatarList.y, "Instances", oAvatarListItem);
				avatarItem.visible = false;
				avatarItem.mId = avatarInfo[?"id"];
				avatarItem.mAvatarUri = avatarInfo[?"uri"];
				avatarItem.isOwned = avatarInfo[?"owned"];
				if(!avatarItem.isOwned)
				{
					avatarItem.mRequiredLevel = avatarInfo[?"requiredLevel"];
					avatarItem.mCreditCost = avatarInfo[?"creditCost"];
					avatarItem.mRareCost = avatarInfo[?"rareCost"];
				}
				else
				{
					avatarItem.mRequiredLevel = 0;
					avatarItem.mCreditCost = 0;
					avatarItem.mRareCost = 0;
				}
				ds_map_destroy(avatarInfo);
				ds_list_add(oAvatarList.mList, avatarItem);
			}
			oAvatarList.mState = "SHOW";
		}
		ds_list_destroy(avatarList);
		break;
	case LOBBY.ACQUIREAVATAR:
		var acquireAvatar = Lobby_DeserializeAcquireAvatar(argument2);
		var message = instance_create_layer(room_width * 0.5, room_height * 0.5, "PopUp", oWarning);
		message.mMessage = acquireAvatar[?"message"];
		if(message.mMessage == "Avatar Acquired.")
		{
			var getAvatarList = Lobby_SerializeGetAvatarList();
			SendPacket(getAvatarList);
			buffer_delete(getAvatarList);
			oAvatarList.mState = "HIDE";
		}
		ds_map_destroy(acquireAvatar);
		break;
	case LOBBY.GETDICELIST:
		var diceList = Lobby_DeserializeGetDiceList(argument2);
		if(rm_Profile == room)
		{
			for(var i = 0; i < ds_list_size(oDiceList.mList); ++i)
			{
				instance_destroy(oDiceList.mList[|i]);
			}
			ds_list_clear(oDiceList.mList);
			for(var i = 0; i < ds_list_size(diceList); ++i)
			{
				var diceInfo = diceList[|i];
				var diceItem = instance_create_layer(oDiceList.x - room_width, oDiceList.y, "Instances", oDiceListItem);
				diceItem.visible = false;
				diceItem.mId = diceInfo[?"id"];
				diceItem.mUri = diceInfo[?"uri"];
				diceItem.isOwned = diceInfo[?"owned"];
				if(!diceItem.isOwned)
				{
					diceItem.mRequiredLevel = diceInfo[?"requiredLevel"];
					diceItem.mCreditCost = diceInfo[?"creditCost"];
					diceItem.mRareCost = diceInfo[?"rareCost"];
				}
				else
				{
					diceItem.mRequiredLevel = 0;
					diceItem.mCreditCost = 0;
					diceItem.mRareCost = 0;
				}
				ds_map_destroy(diceInfo);
				ds_list_add(oDiceList.mList, diceItem);
			}
			oDiceList.mState = "SHOW";
		}
		ds_list_destroy(diceList);
		break;
	case LOBBY.ACQUIREDICE:
		var acquireDice = Lobby_DeserializeAcquireDice(argument2);
		var message = instance_create_layer(room_width * 0.5, room_height * 0.5, "PopUp", oWarning);
		message.mMessage = acquireDice[?"message"];
		if(message.mMessage == "Dice Acquired.")
		{
			var getDiceList = Lobby_SerializeGetDiceList();
			SendPacket(getDiceList);
			buffer_delete(getDiceList);
			oAvatarList.mState = "HIDE";
		}
		ds_map_destroy(acquireDice);
		break;
	case LOBBY.GETNEXTAWARD:
		var award = Lobby_DeserializeGetNextAward(argument2);
		if(room == rm_Award)
		{
			oAwardMenu.mCredits = award[?"credits"];
			oAwardMenu.mAvatarId = award[?"avatarId"];
			oAwardMenu.mAvatarUri = award[?"avatarUri"];
		}
		ds_map_destroy(award);
		break;*/
	default:
		repeat(argument1 - 5) buffer_read(argument2, buffer_u8);
}
