/// @description SendPacket
/// @arg0 buffer

if(os_browser == browser_not_a_browser)
{
	var bytes = network_send_raw(mSocketRef, argument0, buffer_tell(argument0));
	if(bytes < buffer_tell(argument0))
	{
		return false;
	}
	else
	{
		return true;
	}
}
