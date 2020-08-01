/// @description  General hotkeys
if( !avoidance_is_playing() ) {
    instance_destroy();
    exit;
}

var avoidance = global.ActiveAvoidance;
if( button_check_pressed( global.AvoidancePause ) ) {
    avoidance.IsPaused = !avoidance.IsPaused;   
}

var wheelUp = mouse_wheel_up();
var wheelDown = mouse_wheel_down();
if( wheelUp || wheelDown ) {
    if( wheelUp ) {
        avoidance.MusicVolume = min( 1, avoidance.MusicVolume + 0.1 );
    } else {
        avoidance.MusicVolume = max( 0, avoidance.MusicVolume - 0.1 );
    }
    var vol = audio_sound_get_gain( avoidance.MusicId ) * avoidance.MusicVolume * global.MusicVolume * global.MasterVolume;
    audio_sound_gain( avoidance.MusicInstance, vol, 0 );
    oAvoidanceDebugInfo.MusicVolumeAlpha = 2;
}

/// Shortcuts
for( var i = 0; i < ShortcutCount; i++ ) {
    if( keyboard_check( ShortcutKeys[i] ) ) { 
        var avoidance = global.ActiveAvoidance;
        avoidance.StartTiming = ShortcutSteps[i];
        event_user( 0 );
    }
}

