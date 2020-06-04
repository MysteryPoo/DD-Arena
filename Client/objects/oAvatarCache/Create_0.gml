/// @description oAvatarCache->Create

mCache = ds_map_create();
mRequestQueue = ds_list_create();
mProcessingQueue = ds_list_create();

mCache[?"empty"] = sAvatar;
mCache[?"ai"] = sAIPlayer;
mCache[?"human"] = sHumanPlayer;
