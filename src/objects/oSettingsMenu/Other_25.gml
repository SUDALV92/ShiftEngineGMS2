/// @description  Update option values.
OptionValues[0] = string( round( global.MasterVolume * 100 ) ) + "%";
OptionValues[1] = string( round( global.MusicVolume * 100 ) ) + "%";
OptionValues[2] = "Off";
if( global.MusicMuted ) {
    OptionValues[2] = "On";
}
OptionValues[3] = "Off";
if( global.SmoothTextures ) {
    OptionValues[3] = "On";
}

