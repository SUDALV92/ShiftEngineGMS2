/// @description  Debug UI

if( global.DebugGui ) {
    if( instance_number( oPlayer ) > 0 ) {
        draw_debug_ui( instance_find( oPlayer, 0 ), 5, 5, c_white, fDebugFont );
    } else {
        draw_debug_ui( noone, 5, 5, c_white, fDebugFont );
    }
}


