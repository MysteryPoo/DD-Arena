/// @description
for (var key = ds_map_find_first(mPlayerMap); key != undefined; key = ds_map_find_next(mPlayerMap, key)) {
	var _playerDataMap = mPlayerMap[?key];
	var _controllerKey = _playerDataMap[?"controllerKey"];
	
	instance_destroy(_playerDataMap[?"instance"]);
	
	var _controller = oControllerMgr.mControllerMap[_controllerKey];
	instance_destroy(_controller);
	ds_map_delete(oControllerMgr.mControllerMap, _controllerKey);
	ds_map_destroy(_playerDataMap);
}
ds_map_destroy(mPlayerMap);
