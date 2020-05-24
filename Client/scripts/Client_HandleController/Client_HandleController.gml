/// @description Handle Controller
/// @arg0 data

var _response = Client_DeserializeController(argument0);

var _key = _response[?"key"];

var _controller = GetController(_key);

_controller.mIsLeft = _response[?"isLeft"];
_controller.mIsRight = _response[?"isRight"];
_controller.mIsUp = _response[?"isUp"];
_controller.mIsDown = _response[?"isDown"];
_controller.mIsPrimaryAction = _response[?"isPrimaryAction"];
_controller.mIsSecondaryAction = _response[?"isSecondaryAction"];
_controller.mPointerX = _response[?"pointerX"];
_controller.mPointerY = _response[?"pointerY"];

ds_map_destroy(_response);
