/// @description GetFrameCountFromURI
/// @arg0 URI
/// @return frameCount

var strLength = string_length(argument0);
var countAsString = "";
var count = 1;
var index = 1;
while(index <= strLength)
{
	var character = string_char_at(argument0, index++);
	if(character == "-")
	{
		countAsString = "";
	}
	else
	{
		if(character == ".")
		{
			count = real(countAsString);
		}
		else
		{
			countAsString += character;
		}
	}
}

return count;
