/// @description  Decrease music.
global.MusicVolume = max( 0, global.MusicVolume - 0.01 );
update_music_volume();
event_user( 15 );

