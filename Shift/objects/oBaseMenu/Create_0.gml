OptionCount = array_length_1d( MenuOptions );

ActiveOptionPos = 0;
for( var i = 0; i < OptionCount; i++ ) {
    if( !OptionDisabled[i] ) {
        ActiveOptionPos = i;
        break;
    }
}

TickImageIndex = 0;
TickImageSpeed = 2 / 45;

MenuNextHoldStep = 0;
MenuPrevHoldStep = 0;
MenuIncHoldStep = 0;
MenuDecHoldStep = 0;
MenuSurface = noone;

