/// @description oPlayerCache->Destroy

var iter = ds_map_find_first(mCache);
var last = ds_map_find_last(mCache);
while(iter != last)
{
	ds_map_destroy(iter);
	iter = ds_map_find_next(mCache, iter);
}
ds_map_destroy(mCache);
ds_list_destroy(mRequestQueue);
