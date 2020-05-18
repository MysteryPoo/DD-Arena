/// @description oLobbyClient->Destroy

if(mSocketRef != -1) network_destroy(mSocketRef);
instance_destroy(mFriendListRef);
instance_destroy(mMessageListRef);
instance_destroy(mLobbyListRef);
