if( !instance_exists( oPlayer ) || Step >= Duration || IsPaused ) {
    stop_sound( MusicInstance );
    MusicStartRequired = true;
    exit;
} else if( MusicStartRequired ) {
    var vol = audio_sound_get_gain( MusicId ) * MusicVolume * global.MusicVolume * global.MasterVolume;
    MusicInstance = audio_play_sound( MusicId, 0, false );
    audio_sound_gain( MusicInstance, vol, 0 );
    audio_sound_set_track_position( MusicInstance, Step / room_speed );
    MusicStartRequired = false;
}

// Correct the game time if it desyncs from real time.
var deltaStep = RealStep - Step;
if( abs( deltaStep ) > 5 ) {
    // A big lag spike, adjust music to game time.
   audio_sound_set_track_position( MusicInstance, Step / room_speed );
   RealStep = Step;
}

