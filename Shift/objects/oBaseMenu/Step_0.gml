if( !IsEnabled ) {
    exit;
}
TickImageIndex += TickImageSpeed;

if( button_check_pressed( global.MenuBackKeyBind ) ) {
    if( BackEventId >= 0 ) {
        event_user( BackEventId );
    }
}

if( button_check( global.MenuNextKeyBind ) ) {
    MenuNextHoldStep++;
} else {
    MenuNextHoldStep = 0;
}
if( button_check_pressed( global.MenuNextKeyBind ) || ( MenuNextHoldStep >= 23 && MenuNextHoldStep % 4 == 0 ) ) {
    var optionPos = ActiveOptionPos + 1;
    while( true ) {
        if( optionPos >= OptionCount ) {
            optionPos = 0;
        }
        if( !OptionDisabled[optionPos] || optionPos == ActiveOptionPos ) {
            ActiveOptionPos = optionPos;
            break;
        }
        optionPos++;
    }
}

if( button_check( global.MenuPreviousKeyBind ) ) {
    MenuPrevHoldStep++;
} else {
    MenuPrevHoldStep = 0;
}
if( button_check_pressed( global.MenuPreviousKeyBind ) || ( MenuPrevHoldStep >= 23 && MenuPrevHoldStep % 4 == 0 ) ) {
    var optionPos = ActiveOptionPos - 1;
    while( true ) {
        if( optionPos < 0 ) {
            optionPos = OptionCount - 1;
        }
        if( !OptionDisabled[optionPos] || optionPos == ActiveOptionPos ) {
            ActiveOptionPos = optionPos;
            break;
        }   
        optionPos--;
    }
}

if( button_check_pressed( global.MenuSelectKeyBind ) || button_check_pressed( global.MenuSelectSecondKeyBind ) ) {
    if( !OptionDisabled[ActiveOptionPos] ) {
        var confirmEventId = ConfirmEventIds[ActiveOptionPos];
        if( confirmEventId >= 0 ) {
            event_user( confirmEventId );
        }
    }
}

if( button_check( global.MenuIncreaseKeyBind ) ) {
    MenuIncHoldStep++;
} else {
    MenuIncHoldStep = 0;
}
if( button_check_pressed( global.MenuIncreaseKeyBind ) || MenuIncHoldStep >= 20 ) {
    if( !OptionDisabled[ActiveOptionPos] ) {
        var increaseEventId = IncreaseEventIds[ActiveOptionPos];
        if( increaseEventId >= 0 ) {
            event_user( increaseEventId );
        }
    }    
}

if( button_check( global.MenuDecreaseKeyBind ) ) {
    MenuDecHoldStep++;
} else {
    MenuDecHoldStep = 0;
}
if( button_check_pressed( global.MenuDecreaseKeyBind ) || MenuDecHoldStep >= 20 ) {
    if( !OptionDisabled[ActiveOptionPos] ) {
        var decreaseEventId = DecreaseEventIds[ActiveOptionPos];
        if( decreaseEventId >= 0 ) {
            event_user( decreaseEventId );
        }
    } 
}

