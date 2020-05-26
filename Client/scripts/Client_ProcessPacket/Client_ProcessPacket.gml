/// @description Client_ProcessPacket
/// @arg0 command
/// @arg1 commandSize
/// @arg2 data

switch(argument0)
{
	case CLIENT_MESSAGE_ID.CHALLENGE:
		Client_HandleChallenge();
		break;
	case CLIENT_MESSAGE_ID.CONTROLLERDATA:
		Client_HandleController(argument2);
		break;
	case CLIENT_MESSAGE_ID.GAMESTATE:
		Client_HandleGameState(argument2);
		break;
	case CLIENT_MESSAGE_ID.HANDSHAKE:
		Client_HandleHandshake(argument2);
		break;
	case CLIENT_MESSAGE_ID.PING:
		Client_HandlePing(argument2);
		break;
	case CLIENT_MESSAGE_ID.PLAYERDATA:
		Client_HandlePlayerData(argument2);
		break;
	case CLIENT_MESSAGE_ID.SYNCPOSITION:
		Client_HandleSyncPosition(argument2);
		break;
	/*case PACKET.PLAYERDATA:
		show_debug_message("Client: Got some player data!");
		var _numPlayers = buffer_read(argument2, buffer_u8);
		show_debug_message("numPlayers: " + string(_numPlayers));
		for(var i = 0; i < _numPlayers; ++i)
		{
			// Ensure our list is of the appropriate size
			while(ds_list_size(oTurnController.mPlayerList) <= i)
			{
				ds_list_add(oTurnController.mPlayerList, noone);
			}
			// Ensure we have a local representation of the player
			if(oTurnController.mPlayerList[|i] == noone)
			{
				// Find X, Y based on number of players
				//var _interval = 180 / (_numPlayers - 1) * i;
				//var _x = (room_width * 0.5) + 500 * dcos(_interval);
				//var _y = (room_height * 0.5) - 500 * dsin(_interval);
				var _x = oTurnController.x;
				var _y = oTurnController.y + 256 * i;
				oTurnController.mPlayerList[|i] = instance_create_layer(_x, _y, "Instances", oPlayerSheet);
			}
			// This is the current player we're updating
			var _player = oTurnController.mPlayerList[|i];
			var _response = Client_DeserializePlayerData(argument2);
			_player.mPlayerName = _response[?"name"];
			_player.isAI = _response[?"isAI"];
			_player.mColor = mColorArray[i];
			_player.mControlledBy = _response[?"controlledBy"];
			if(_player.mArmy.mValue != _response[?"armySize"])
			{
				_player.mArmy.mValue = _response[?"armySize"];
				// TODO : Origin of this should not be from center-screen
				var _army = instance_create_layer(room_width * 0.5, room_height * 0.5, "Instances", obj_SoldierGroup);
				_army.mTargetX = _player.mArmy.x;
				_army.mTargetY = _player.mArmy.y;
			}
			_player.mCard = _response[?"card"];
			_player.mInOrbit = _response[?"inOrbit"];
			_player.isTargetable = _response[?"isTargetable"];
			ds_map_destroy(_response);
		}
		break;
	case PACKET.NEXTTURN:
		var _response = Client_DeserializeNextTurn(argument2);
		_response[?"packetType"] = PACKET.NEXTTURN;
		ds_list_add(mActionQueue, _response);
		break;
	case PACKET.ROLLDICE:
		var _numDice = buffer_read(argument2, buffer_u8);
		repeat(_numDice)
		{
			var _response = Client_DeserializeRollDice(argument2);
			_response[?"packetType"] = PACKET.ROLLDICE;
			ds_list_add(mActionQueue, _response);
		}
		break;
	case PACKET.ROLLEVENTDICE:
		var _response = Client_DeserializeRollEventDice(argument2);
		_response[?"packetType"] = PACKET.ROLLEVENTDICE;
		ds_list_add(mActionQueue, _response);
		break;
	case PACKET.TAKEACTION:
		var _response = Client_DeserializeTakeAction(argument2);
		_response[?"packetType"] = PACKET.TAKEACTION;
		ds_list_add(mActionQueue, _response);
		break;
	case PACKET.PENDINGCARD:
		var _response = Client_DeserializePendingCard(argument2);
		_response[?"packetType"] = PACKET.PENDINGCARD;
		ds_list_add(mActionQueue, _response);
		break;
	case PACKET.DIEGRABBER:
		var _response = Client_DeserializeDieGrabber(argument2);
		with(oScoreCard)
		{
			if(mDieGrabber != noone)
			{
				mDieGrabber.x = _response[?"x"];
				mDieGrabber.y = _response[?"y"];
				mDieGrabber.mMouseDown = _response[?"mouseDown"];
			}
		}
		ds_map_destroy(_response);
		break;
	case PACKET.DIEGRABBERRELEASE:
		var _response = Client_DeserializeDieGrabberRelease(argument2);
		_response[?"packetType"] = PACKET.DIEGRABBERRELEASE;
		ds_list_add(mActionQueue, _response);
		break;
	case PACKET.BRAWLINFO:
		var _response = Client_DeserializeBrawlInfo(argument2);
		if(_response[?"attackerIndex"] == 0 &&
			_response[?"defenderIndex"] == 0 &&
			_response[?"attackerScore"] == 0)
		{
			// Special case indicating end of Brawl
			with(oBrawlInfo) instance_destroy();
		}
		else
		{
			if(!instance_exists(oBrawlInfo))
			{
				instance_create_layer(0, 0, "Instances", oBrawlInfo);
			}
			oBrawlInfo.mAttackerIndex = _response[?"attackerIndex"];
			oBrawlInfo.mDefenderIndex = _response[?"defenderIndex"];
			oBrawlInfo.mAttackerScore = _response[?"attackerScore"];
		}
		ds_map_destroy(_response);
		break;
	case PACKET.BRAWLTARGET:
		var _response = Client_DeserializeBrawlTarget(argument2);
		_response[?"packetType"] = PACKET.BRAWLTARGET;
		ds_list_add(mActionQueue, _response);
		break;
	case PACKET.DESTROYFLEET:
		var _response = Client_DeserializeDestroyFleet(argument2);
		_response[?"packetType"] = PACKET.DESTROYFLEET;
		ds_list_add(mActionQueue, _response);
		break;
	case PACKET.STEALFLEET:
		var _response = Client_DeserializeStealFleet(argument2);
		_response[?"packetType"] = PACKET.STEALFLEET;
		ds_list_add(mActionQueue, _response);
		break;
	case PACKET.CHANGEDIE:
		var _response = Client_DeserializeChangeDie(argument2);
		_response[?"packetType"] = PACKET.CHANGEDIE;
		ds_list_add(mActionQueue, _response);
		break;
	case PACKET.USECARD:
		var _response = Client_DeserializeUseCard(argument2);
		_response[?"packetType"] = PACKET.USECARD;
		ds_list_add(mActionQueue, _response);
		break;
	case PACKET.GAMEOVER:
		var _response = Client_DeserializeGameOver(argument2);
				
		var _playerName = oTurnController.mPlayerList[|_response[?"playerIndex"]].mPlayerName;
				
		mPendingGameOver = true;
		mPendingWinner = _playerName;
				
		ds_map_destroy(_response);
		break;*/
	default:
		repeat(argument1 - 2) buffer_read(argument2, buffer_u8);
}