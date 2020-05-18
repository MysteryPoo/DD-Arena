/// @description Handle Challenge
/// @arg0 data
show_debug_message("CHALLENGE");
var _challenge = Lobby_DeserializeChallenge(argument0);
		
var _paramsMap = ds_map_create();
_paramsMap[?"id"] = mId;
_paramsMap[?"password"] = mPassword;
_paramsMap[?"device_uuid"] = mDeviceUUID;
_paramsMap[?"protocolVersion"] = mProtocolVersion;
var _handshake = Lobby_SerializeHandshake(_paramsMap);
SendPacket(_handshake);
				
ds_map_destroy(_paramsMap);
ds_map_destroy(_challenge);
buffer_delete(_handshake);
