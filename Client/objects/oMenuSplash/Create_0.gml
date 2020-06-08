/// @description oMainMenu->Create

mButtonOnline = iButtonOnline;
mButtonStartGame = iButtonStartGame;
mButtonReady = iButtonReady;
mButtonNotReady = iButtonNotReady;
mButtonPrivate = iButtonPrivate;
mButtonPublic = iButtonPublic;
mButtonIncrease = iIncreaseLobbySize;
mButtonDecrease = iDecreaseLobbySize;
mTextLobbySize = iTextLobbySize;
mTextError = iTextError;

/* TEMP VARIABLES */
mLobbySize = 1;
mIsPublicLobby = false;
mNeedToJoinALobby = true;

if (os_type == os_android || os_type == os_ios)
{
	os_powersave_enable(false);
}
