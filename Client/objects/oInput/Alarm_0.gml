/// @description Send Input
alarm[0] = mRate;

if (mControllerKey >= 0)
{
	with(oGameClient)
	{
		var _controller = ds_map_create();
	
		_controller[?"key"] = other.mControllerKey;
		_controller[?"isPrimaryAction"] = mouse_check_button(mb_left);
		_controller[?"isSecondaryAction"] = mouse_check_button(mb_right);
		_controller[?"isUp"] = keyboard_check(ord("W"));
		_controller[?"isDown"] = keyboard_check(ord("S"));
		_controller[?"isLeft"] = keyboard_check(ord("A"));
		_controller[?"isRight"] = keyboard_check(ord("D"));
		_controller[?"pointerX"] = mouse_x;
		_controller[?"pointerY"] = mouse_y;
	
		var _buffer = Client_SerializeController(_controller);
		SendPacket(_buffer);
		buffer_delete(_buffer);
	
		ds_map_destroy(_controller);
	}
}
