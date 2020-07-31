/// @description  Decrease sound.
global.MasterVolume = max( 0, global.MasterVolume - 0.01 );
update_music_volume();
event_user( 15 );

