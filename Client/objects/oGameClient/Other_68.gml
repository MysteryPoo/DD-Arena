/// @description oGameClient->Networking

var _packetInfo = async_load;

var _eventType = _packetInfo[?"type"];
var _eventId = _packetInfo[?"id"];

if(_eventId != mSocketRef)
{
	exit; // Not meant for us
}

if(_eventType == network_type_non_blocking_connect)
{
	// Waiting for a Challenge
	mIsConnected = true;
}
else if(_eventType == network_type_data)
{
	// OLD STUFF
	var _data = _packetInfo[?"buffer"];
	var _datasize = _packetInfo[?"size"];
	// END OF OLD STUFF
	
	var _beginIndex = buffer_tell(_data);
	var _endIndex = _beginIndex + _datasize;
	
	while(buffer_tell(_data) < _endIndex)
	{
		var _command = buffer_read(_data, buffer_u8);
		if(_command != CLIENT_MESSAGE_ID.PING)
			show_debug_message("Packet command: " + string(_command));
		var _commandSize = buffer_read(_data, buffer_u8);
		if(_command != CLIENT_MESSAGE_ID.PING)
			show_debug_message("Packet command size: " + string(_commandSize));
		if(buffer_tell(_data) + _commandSize - 2 > _endIndex)
		{
			show_debug_message("Client: Bad packet discovered");
			exit; // Improper packet
		}
		Client_ProcessPacket(_command, _commandSize, _data);
	}
}
