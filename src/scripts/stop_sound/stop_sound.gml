/// @description  stop_sound( soundInstance )
/// @param  soundInstance 
var soundId = argument0;
if( audio_is_playing( soundId ) ) {
    audio_stop_sound( soundId );
}
