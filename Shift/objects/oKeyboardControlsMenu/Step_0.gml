if( !IsEnabled ) {
    exit;
}
TickImageIndex += TickImageSpeed;

if( IsKeyScanActive ) {
    if( button_check_pressed( global.MenuBackKeyBind ) ) {
        IsKeyScanActive = false;
    } else if( keyboard_check_pressed( vk_anykey ) ) {
        var newKey = keyboard_key;
        if( newKey == 0 ) {
            exit;
        }
        if( newKey == vk_lshift || newKey == vk_rshift ) {
            newKey = vk_shift;
        }
        KeyCodes[ActiveOptionPos] = newKey;
        set_keyboard_bind( ActiveOptionPos, newKey );
        IsKeyScanActive = false;
    }    
    exit;
}

if( button_check_pressed( global.MenuBackKeyBind ) ) {
    event_user( 1 );
}

if( button_check( global.MenuNextKeyBind ) ) {
    MenuNextHoldStep++;
} else {
    MenuNextHoldStep = 0;
}
if( button_check_pressed( global.MenuNextKeyBind ) || ( MenuNextHoldStep >= 23 && MenuNextHoldStep % 4 == 0 ) ) {
    var columnPos = ActiveOptionPos;
    for( var j = 0; j < ActiveColumnPos; j++ ) {
        columnPos -= ColumnKeyCount[j];
    }
    if( columnPos == ColumnKeyCount[ActiveColumnPos] - 1 ) {
        ActiveOptionPos = OptionCount - 1;
    } else if( ActiveOptionPos < OptionCount - 1 ) {
        ActiveOptionPos++;
    } else {
        // Jump to the first option on an active column.
        var menuPos = 0;
        for( var i = 0; i < ActiveColumnPos; i++ ) {
            menuPos += ColumnKeyCount[i];
        }
        ActiveOptionPos = menuPos;
    }
}

if( button_check( global.MenuPreviousKeyBind ) ) {
    MenuPrevHoldStep++;
} else {
    MenuPrevHoldStep = 0;
}
if( button_check_pressed( global.MenuPreviousKeyBind ) || ( MenuPrevHoldStep >= 23 && MenuPrevHoldStep % 4 == 0 ) ) {
    if( ActiveOptionPos == OptionCount - 1 ) {
        // Jump to the bottom option of an active column.
        var menuPos = 0;
        for( var i = 0; i < ActiveColumnPos; i++ ) {
            menuPos += ColumnKeyCount[i];
        }
        ActiveOptionPos = menuPos + ColumnKeyCount[ActiveColumnPos] - 1;
    } else {
        var columnPos = ActiveOptionPos;
        for( var j = 0; j < ActiveColumnPos; j++ ) {
            columnPos -= ColumnKeyCount[j];
        }
        if( columnPos > 0 ) {
            ActiveOptionPos--;
        } else {
            ActiveOptionPos = OptionCount - 1;
        }
    }
}

if( button_check_pressed( global.MenuSelectKeyBind ) || button_check_pressed( global.MenuSelectSecondKeyBind ) ) {
    event_user( 0 );
}

if( button_check( global.MenuIncreaseKeyBind ) ) {
    MenuIncHoldStep++;
} else {
    MenuIncHoldStep = 0;
}
if( button_check_pressed( global.MenuIncreaseKeyBind ) || MenuIncHoldStep >= 20 ) {
    if( ActiveOptionPos < OptionCount - 1 && ActiveColumnPos < ColumnCount - 1 ) {
        var columnPos = ActiveOptionPos;
        for( var j = 0; j < ActiveColumnPos; j++ ) {
            columnPos -= ColumnKeyCount[j];
        }
        if( columnPos < ColumnKeyCount[ActiveColumnPos + 1] ) {
            ActiveOptionPos += ColumnKeyCount[ActiveColumnPos];
            ActiveColumnPos++;
        }
    }
}

if( button_check( global.MenuDecreaseKeyBind ) ) {
    MenuDecHoldStep++;
} else {
    MenuDecHoldStep = 0;
}
if( button_check_pressed( global.MenuDecreaseKeyBind ) || MenuDecHoldStep >= 20 ) {
    if( ActiveOptionPos < OptionCount - 1 && ActiveColumnPos > 0 ) {
        var columnPos = ActiveOptionPos;
        for( var j = 0; j < ActiveColumnPos; j++ ) {
            columnPos -= ColumnKeyCount[j];
        }
        if( columnPos < ColumnKeyCount[ActiveColumnPos - 1] ) {
            ActiveColumnPos--;
            ActiveOptionPos -= ColumnKeyCount[ActiveColumnPos];    
        }
    }
}

