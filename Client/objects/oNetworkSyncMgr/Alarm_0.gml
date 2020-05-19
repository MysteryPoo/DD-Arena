/// @description Sync Positions
alarm[0] = room_speed * 0.5;

with(oPlayer) // TODO : Consider making a parent "Syncable" object that other objects can inherit
{
	var _request = ds_map_create();
	_request[?"objectID"] = id;
	_request[?"x"] = x;
	_request[?"y"] = y;
	
	var _buffer = Client_SerializeSyncPosition(_request);
	with(oGameClient)
		SendPacket(_buffer);
	
	buffer_delete(_buffer);
	ds_map_destroy(_request);
}
