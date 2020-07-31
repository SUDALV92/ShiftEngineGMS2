// Find an active tick.
var avoidance = global.ActiveAvoidance;
var mouseDeltaY = abs( mouse_y - EditSliderY );
var bestTickPos = -1;
if( mouseDeltaY < 24 ) {
    var timingsList = oAvoidancePersistentData.TimingsList;
    var count = ds_list_size( timingsList );
    var bestTickDelta = 5;
    for( var i = 0; i < count; i++ ) {
        var tickStep = timingsList[|i];
        var tickRelPos = tickStep / avoidance.Duration;
        tickRelPos = clamp( tickRelPos, 0, 1 );
        var tickPxPos = EditSliderLeft + tickRelPos * EditSliderLength;
        var mouseDeltaX = abs( mouse_x - tickPxPos );
        if( mouseDeltaX <= bestTickDelta ) {
            bestTickPos = i;
            bestTickDelta = mouseDeltaX;
        }
    }
}
ActiveTickPos = bestTickPos;

if( mouse_check_button_pressed( mb_left ) ) {
    if( mouseDeltaY < 24 ) {
        var clickPosX = mouse_x - EditSliderLeft;
        var relPos = clickPosX / EditSliderLength;
        if( ActiveTickPos != -1 ) {
            relPos = ( timingsList[|ActiveTickPos] - 1 ) / avoidance.Duration;
        }
        relPos = clamp( relPos, 0, 1 );
        var stepPos = round( relPos * avoidance.Duration );
        avoidance_set_step( stepPos );
    }
}


