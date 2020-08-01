if( !avoidance_is_playing() ) {
    instance_destroy();
    exit;
}
var avoidance = global.ActiveAvoidance;
var step = avoidance.Step;
var timingsList = oAvoidancePersistentData.TimingsList;
var timingsCount = ds_list_size( timingsList );
var cam = view_get_camera(0);
var panelX = camera_get_view_x(cam) + PanelXOffset;
var panelY = camera_get_view_y(cam) + PanelYOffset;

if( !avoidance.IsPaused ) {
    for( var i = 0; i < timingsCount; i++ ) {  
        var timing = timingsList[|i];   
        if( timing == step + 1 ) {
            play_sound( sndSnap );
            break;
        } else if( timing > step ) {
             break;
        }
    }
}

if( button_check_pressed( global.AvoidanceAddTiming ) ) {
    var newTiming = step;
    for( var i = 0; i < timingsCount; i++ ) {
        var timing = timingsList[|i];   
        if( timing >= newTiming ) {
            ds_list_insert( timingsList, i, newTiming );
            play_sound( sndSnap );
            exit;
        }
    }
    ds_list_insert( timingsList, timingsCount, newTiming );
    play_sound( sndSnap );
}

var lMousePressed = mouse_check_button_pressed( mb_left );
var rMousePressed = mouse_check_button_pressed( mb_right );
if( lMousePressed || rMousePressed ) {
    // Find the display count.
    var displayStep = step;
    if( TableFreezeTiming != -1 ) {
       displayStep = TableFreezeTiming;
    }
    
    var count = ds_list_size( timingsList );
    var displayCount = 0;
    var firstTimingPos = 0;
    for( var i = 0; i < count; i++ ) {
        var currentStep = timingsList[|i];
        if( currentStep > displayStep - TimingDisplayDelay ) {
            firstTimingPos = i;
            displayCount = min( MaxLineDisplayCount + 1, count - i );
            break;
        }
    }

    var mouseLinePos = floor( ( mouse_y - panelY + 5 ) / LineHeight );
    var timingPos = mouseLinePos + firstTimingPos;
    var lineLeft = panelX + SelectionRectLeft;
    var lineRight = panelX + SelectionRectRight;
    if( mouse_x >= lineLeft && mouse_x < lineRight ) {
        if( mouseLinePos >= 0 && mouseLinePos < displayCount ) {
            var oldTiming = timingsList[|timingPos];
            if( lMousePressed ) {
                var newTiming = get_integer( "Adjust timing", oldTiming );
                if( newTiming > 0 ) {
                    // Delete the old timing and insert a new one.
                    ds_list_delete( timingsList, timingPos );
                    for( var i = 0; i < timingsCount; i++ ) {
                        var timing = timingsList[|i];   
                        if( timing >= newTiming ) {
                            ds_list_insert( timingsList, i, newTiming );
                            exit;
                        }
                    }
                    ds_list_add( timingsList, newTiming );
                }
            } else if( rMousePressed ) {
                avoidance_set_step( oldTiming );
                TableFreezeTiming = oldTiming;
            }
        }
    } else if( mouse_x >= lineRight && mouse_x < lineRight + 2 * CrossRectHWidth ) {
        if( mouseLinePos >= 0 && mouseLinePos < displayCount ) {
            if( lMousePressed ) {
                ds_list_delete( timingsList, timingPos );
            } else if( rMousePressed ) {
                var timing = timingsList[|timingPos];
                avoidance_set_step( timing );
                TableFreezeTiming = timing;
            }
        }
    }   
}