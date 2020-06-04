/// @description oAvatarCache->Destroy

var iter = ds_map_find_first(mCache);
var last = ds_map_find_last(mCache);
while(iter != last)
{
	sprite_delete(iter);
	iter = ds_map_find_next(mCache, iter);
}
ds_map_destroy(mCache);
ds_list_destroy(mRequestQueue);
ds_list_destroy(mProcessingQueue);
