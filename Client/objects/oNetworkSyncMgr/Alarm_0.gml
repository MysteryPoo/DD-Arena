/// @description Sync Positions
alarm[0] = mSyncRate;

if (!instance_exists(oGameClient) /*|| !oGameClient.mIsHost*/) exit;

for (var key = ds_map_find_first(mSyncMap); key != undefined; key = ds_map_find_next(mSyncMap, key)) {
	var _instance = mSyncMap[?key];
	
	var _request = ds_map_create();
	_request[?"key"] = key;
	_request[?"x"] = max(0, _instance.x);
	_request[?"y"] = max(0, _instance.y);
	_request[?"hitPoints"] = max(0, _instance.mHitPoints);
	
	var _buffer = Client_SerializeSyncPosition(_request);
	with(oGameClient)
		SendPacket(_buffer);
	
	buffer_delete(_buffer);
	ds_map_destroy(_request);
}
