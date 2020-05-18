/// @description Handle Controller
/// @arg0 data

var _response = Client_DeserializeController(argument0);

if (_response[?"index"] < array_length_1d(oControllerMgr.mControllers))
{
	var _controller = oControllerMgr.mControllers[_response[?"index"]];
	_controller.mIsLeft = _response[?"isLeft"];
	_controller.mIsRight = _response[?"isRight"];
	_controller.mIsUp = _response[?"isUp"];
	_controller.mIsDown = _response[?"isDown"];
	_controller.mIsPrimaryAction = _response[?"isPrimaryAction"];
	_controller.mIsSecondaryAction = _response[?"isSecondaryAction"];
	_controller.mPointerX = _response[?"pointerX"];
	_controller.mPointerY = _response[?"pointerY"];
}

ds_map_destroy(_response);
