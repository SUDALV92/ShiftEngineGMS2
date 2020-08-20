/// @description  Increase sound.
global.MasterVolume = min( 1, global.MasterVolume + 0.01 );
update_music_volume();
event_user( 15 );

