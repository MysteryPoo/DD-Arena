/// @description

var _stateString = "";

switch(mGameState) {
	case GAMESTATE.WAITING:
		_stateString = "Waiting";
		break;
	case GAMESTATE.COUNTDOWN:
		_stateString = "Countdown";
		break;
	case GAMESTATE.GAMEPLAY:
		_stateString = "Gameplay";
		break;
	case GAMESTATE.END:
		_stateString = "End";
		break;
}

draw_text(view_xport[0] + view_wport[0] * 0.5, view_yport[0] + 64, _stateString);
draw_text(view_xport[0] + view_wport[0] * 0.5, view_yport[0] + 86, string(mMetaData));
