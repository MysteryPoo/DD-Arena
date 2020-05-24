/// @description 
if (noone == mFollow || !instance_exists(mFollow)) {
	for (var key = ds_map_find_first(oPlayerDataMgr.mPlayerMap); key != undefined; key = ds_map_find_next(oPlayerDataMgr.mPlayerMap, key)) {
		var _playerDataMap = oPlayerDataMgr.mPlayerMap[?key];
		if (_playerDataMap[?"isMine"]) {
			mFollow = _playerDataMap[?"instance"];
		}
	}
} else {
	x = mFollow.x;
	y = mFollow.y;
}
