/// @description GetController
/// @arg0 key

var _key = argument0;

if (!ds_map_exists(oControllerMgr.mControllerMap, _key)) {
	var _controller = instance_create_layer(0, 0, "Managers", oController);
	oControllerMgr.mControllerMap[?_key] = _controller;
	var _colorArray = [c_blue, c_green, c_red, c_yellow, c_maroon, c_fuchsia, c_lime, c_olive];
	var _arrSize = array_length_1d(_colorArray);
	_controller.image_blend = _colorArray[clamp(_key, 0, _arrSize)];
}

return oControllerMgr.mControllerMap[?_key];
