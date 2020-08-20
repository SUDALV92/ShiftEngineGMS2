/// @description  Debug: Change V-Align

if( !Frozen ) {
    if( global.Debug && button_check_pressed( global.VAlignDebugKeyBind ) ) {
        var vf = floor( y );
        var va = y - vf;
        var newVa = get_integer( "New V-Align:", va );
        if( newVa >= 0 ) {
            y = vf + newVa;
        }
    }
}


