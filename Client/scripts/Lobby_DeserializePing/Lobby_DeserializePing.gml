/// @description Lobby_DeserializePing
/// @arg0 buffer

var response = ds_map_create();

if(os_browser == browser_not_a_browser)
{
	response[?"time"] = buffer_read(argument0, buffer_u64);
}
else
{
	var upper = buffer_read(argument0, buffer_u32);
	var lower = buffer_read(argument0, buffer_u32);
	response[?"time"] = upper << 32 | lower;
}

return response;
