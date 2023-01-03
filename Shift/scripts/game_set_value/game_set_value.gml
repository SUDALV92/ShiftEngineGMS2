// Set a named value that is saved in the save file.
function game_set_value( valueNameStr, value )
{
	ds_map_replace( oWorld.SaveData, valueNameStr, value );
}