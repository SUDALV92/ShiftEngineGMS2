/// @description  stop_sound( soundInstance )
/// @param  soundInstance 
function stop_sound(argument0) {
	var soundId = argument0;
	if( audio_is_playing( soundId ) ) {
	    audio_stop_sound( soundId );
	}



}
