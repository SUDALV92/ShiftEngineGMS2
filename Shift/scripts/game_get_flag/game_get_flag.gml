// Return a named flag from the save file. False is returned if the flag is not in the save.
function game_get_flag( flagNameStr )
{
	var flagValue = game_get_value( flagNameStr );
	if( is_undefined( flagValue ) ) {
	    return false;
	}
	return flagValue;
}