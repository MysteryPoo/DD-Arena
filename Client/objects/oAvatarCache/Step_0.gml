/// @description oAvatarCache->Step

if(ds_list_size(mRequestQueue) > 0)
{
	var request = mRequestQueue[|0];
	//var URL = "http://content.dragonringstudio.com:60300/" + request;
	var URL = "http://127.0.0.1:60300/" + request;
	ds_list_delete(mRequestQueue, 0);
	if(-1 == mCache[?request])
	{
		var _id = sprite_add(URL, GetFrameCountFromURI(request), true, true, 128, 128);
		ds_list_add(mProcessingQueue, _id);
	}
}
