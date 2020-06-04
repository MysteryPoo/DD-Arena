/// @description Lobby_GetAvatarSpriteFromCache
/// @arg0 avatarURI
/// @return sprite_index of the image loaded from the avatarURI

if(!instance_exists(oAvatarCache)) return -1;

var sprIndex = oAvatarCache.mCache[?argument0];

if(undefined == sprIndex)
{
	oAvatarCache.mCache[?argument0] = -1;
	ds_list_add(oAvatarCache.mRequestQueue, argument0);
}
else if(-1 != sprIndex)
{
	return sprIndex;
}

return -1;
