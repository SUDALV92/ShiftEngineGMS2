/// @description  Back to main menu
if( OverwriteModePos != -1 ) {
    OverwriteModePos = -1;
    OptionDisabled[1] = false;
} else {
    IsEnabled = false;
    oMainMenu.alarm[0] = 1;
    instance_move_to( oMainMenu, oMainMenu.xstart, oMainMenu.ystart, 30 );
    instance_move_to( id, xstart, ystart, 30 );
}

