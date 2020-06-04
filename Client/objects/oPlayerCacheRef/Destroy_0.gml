/// @description 
var _listenerList = oPlayerCache.mGetPlayerInfoFromCacheCallbackListeners;

var _index = ds_list_find_index(_listenerList, id);
ds_list_delete(_listenerList, _index);
