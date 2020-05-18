/// @description oLobbyClient->Networking

var _packetInfo = async_load;

var _eventType = _packetInfo[?"type"];
var _eventId = _packetInfo[?"id"];

if(_eventId != mSocketRef)
{
	exit; // Not meant for us
}

if(_eventType == network_type_non_blocking_connect)
{
	// Awaiting Challenge
}
else if(_eventType == network_type_data)
{
	var _data = _packetInfo[?"buffer"];
	var _datasize = _packetInfo[?"size"];
	
	var _beginIndex = buffer_tell(_data);
	var _endIndex = _beginIndex + _datasize;
	
	while(buffer_tell(_data) < _endIndex)
	{
		var _command = buffer_read(_data, buffer_u8);
		var _commandSize = buffer_read(_data, buffer_u32);
		if(buffer_tell(_data) + _commandSize - 5 > _endIndex)
		{
			show_debug_message("Client: Bad packet discovered");
			exit; // Improper packet
		}
		Lobby_ProcessPacket(_command, _commandSize, _data);
	}
}
