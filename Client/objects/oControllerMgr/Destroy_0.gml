/// @description 
for (var key = ds_map_find_first(mControllerMap); key != undefined; key = ds_map_find_next(mControllerMap, key)) {
	instance_destroy(mControllerMap[?key]);
}
ds_map_destroy(mControllerMap);
