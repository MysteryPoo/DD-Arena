/// @description GetFilenameFromURI
/// @arg0 URI
/// @return filename

var strLength = string_length(argument0);
var filename = "";
var index = 1;
while(index <= strLength)
{
	var character = string_char_at(argument0, index++);
	if(character == "/")
	{
		filename = "";
	}
	else
	{
		filename += character;
	}
}

return filename;
