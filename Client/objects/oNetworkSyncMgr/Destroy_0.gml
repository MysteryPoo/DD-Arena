/// @description 
for (var key = ds_map_find_first(mSyncMap); key != undefined; key = ds_map_find_next(mSyncMap, key)) {
	instance_destroy(mSyncMap[?key]);
}
ds_map_destroy(mSyncMap);
