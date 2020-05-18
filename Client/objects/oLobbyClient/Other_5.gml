/// @description oLobbyClient->RoomEnd

if(mLobbyListRef != noone)
{
	instance_destroy(mLobbyListRef);
	mLobbyListRef = noone;
}

if(mFriendListRef != noone)
{
	instance_destroy(mFriendListRef);
	mFriendListRef = noone;
}

if(mMessageListRef != noone)
{
	instance_destroy(mMessageListRef);
	mMessageListRef = noone;
}
