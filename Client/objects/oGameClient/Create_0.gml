/// @description oGameClient->Create

enum CLIENT_MESSAGE_ID {
    CHALLENGE,
	HANDSHAKE,
	PING,
    PLAYERDATA,
    CONTROLLERDATA,
    SYNCPOSITION,
	GAMEOVER,
	SETVOIP,
	VOIPDATA,
    INVALID
};

mPendingGameOver = false;
mPendingWinner = "";
alarm[0] = 1;
alarm[3] = room_speed * 5; // Timeout
