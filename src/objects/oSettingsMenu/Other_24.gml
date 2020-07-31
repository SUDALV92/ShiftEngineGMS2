/// @description  Save settings.
ini_open( "settings.ini" );
ini_write_real( "Settings", "MasterVolume", global.MasterVolume );
ini_write_real( "Settings", "MusicVolume", global.MusicVolume );
ini_write_real( "Settings", "MusicMuted", global.MusicMuted );
ini_write_real( "Settings", "SmoothTextures", global.SmoothTextures );
ini_close();

