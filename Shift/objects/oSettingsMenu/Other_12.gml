/// @description  Increase music.
global.MusicVolume = min( 1, global.MusicVolume + 0.01 );
update_music_volume();
event_user( 15 );

