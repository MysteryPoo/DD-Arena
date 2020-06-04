/// @description Handle Player Data
/// @arg0 data
var _response = Client_DeserializePlayerData(argument0);

var _playerKey = _response[?"playerKey"];
var _controllerKey = _response[?"controllerKey"];

var _player;

if (ds_map_exists(oPlayerDataMgr.mPlayerMap, _playerKey)) {
	_player = oPlayerDataMgr.mPlayerMap[?_playerKey];
} else {
	// Create a new player data object
	_player = ds_map_create();
	oPlayerDataMgr.mPlayerMap[?_playerKey] = _player;
}

var _instance = GetInstance(_playerKey);
_instance.mController = GetController(_controllerKey);

_player[?"id"] = _response[?"id"];
_player[?"name"] = _response[?"name"]; // This is deprecated
_player[?"isAI"] = _response[?"isAI"];
_player[?"isMine"] = _response[?"isMine"];
_player[?"controllerKey"] = _controllerKey;
_player[?"instance"] = GetInstance(_playerKey);
_player[?"controller"] = GetController(_controllerKey);

_instance.mPlayerCacheRef.mId = _response[?"id"];
_instance.mAvatarCacheRef.mId = _response[?"id"];

if (_player[?"isMine"]) {
	oInput.mControllerKey = _controllerKey;
}

ds_map_destroy(_response);
