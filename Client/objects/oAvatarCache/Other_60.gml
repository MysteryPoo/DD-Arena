/// @description oAvatarCache->LoadImage
var _index = ds_list_find_index(mProcessingQueue, async_load[?"id"]);
if(_index < 0) exit;
if(async_load[?"status"] >= 0)
{
	var filename = GetFilenameFromURI(async_load[?"filename"]);
	if(200 == async_load[?"http_status"] && -1 == mCache[?filename])
	{
		mCache[?filename] = async_load[?"id"];
	}
	else
	{
		sprite_delete(async_load[?"id"]);
	}
	ds_list_delete(mProcessingQueue, _index);
}
else
{
	// Error
}
