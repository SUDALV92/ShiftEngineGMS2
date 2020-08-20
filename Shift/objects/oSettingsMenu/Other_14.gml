/// @description  Toggle music mute.
global.MusicMuted = !global.MusicMuted;
update_music_volume();
event_user( 15 );

