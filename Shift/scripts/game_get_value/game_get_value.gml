// Get a named value that is stored in the save file.
// An undefined value is returned if the value does not exist in the save file.  
function game_get_value( valueNameStr )
{
	return oWorld.SaveData[? valueNameStr];
}
