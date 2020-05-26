/// @description Handle Game State
/// @arg0 data
var _response = Client_DeserializeGameState(argument0);

var _gameState = _response[?"gameState"];
var _metaData = _response[?"metaData"];

with (oGameState) {
	mGameState = _gameState;
	mMetaData = _metaData;
}

ds_map_destroy(_response);
