if( !avoidance_is_playing() ) {
    instance_destroy();
    exit;
}

// Find an active tick.
var cam = view_get_camera(0);
var editSliderY = camera_get_view_y(cam) + SliderVMargin;
var editSliderLeft = camera_get_view_x(cam) + SliderHMargin;
var editSliderRight = camera_get_view_x(cam) + camera_get_view_width(cam) - SliderHMargin;
var editSliderLength = editSliderRight - editSliderLeft;

var avoidance = global.ActiveAvoidance;
var mouseDeltaY = abs( mouse_y - editSliderY );
var bestTickPos = -1;
if( mouseDeltaY < 24 ) {
    var timingsList = oAvoidancePersistentData.TimingsList;
    var count = ds_list_size( timingsList );
    var bestTickDelta = 5;
    for( var i = 0; i < count; i++ ) {
        var tickStep = timingsList[|i];
        var tickRelPos = tickStep / avoidance.Duration;
        tickRelPos = clamp( tickRelPos, 0, 1 );
        var tickPxPos = editSliderLeft + tickRelPos * editSliderLength;
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
        var clickPosX = mouse_x - editSliderLeft;
        var relPos = clickPosX / editSliderLength;
        if( ActiveTickPos != -1 ) {
            relPos = ( timingsList[|ActiveTickPos] - 1 ) / avoidance.Duration;
        }
        relPos = clamp( relPos, 0, 1 );
        var stepPos = round( relPos * avoidance.Duration );
        avoidance_set_step( stepPos );
    }
}
