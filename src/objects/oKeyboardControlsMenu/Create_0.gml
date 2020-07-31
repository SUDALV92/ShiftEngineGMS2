RectWidth = 600;
RectHeight = 300;
ValueOptionLineWidth = 200;

RectColor = make_color_rgb( 70, 70, 70 );
BorderColor = make_color_rgb( 30, 30, 30 );
OptionColor = c_white;
ActiveOptionColor = c_yellow;
ScannedKeyColor = c_lime;

KeybindCount = global.RegisteredKeybindCount;
for( var i = 0; i < KeybindCount; i++ ) {
    KeyNames[i] = global.RegisteredKeybindNames[i] + ":";
    KeyCodes[i] = global.RegisteredKeyboardCodes[i];
}

ColumnCount = 2;
OptionCount = KeybindCount + 1;

var highColumnCount = KeybindCount % ColumnCount;
var lowColumnCount = ColumnCount - highColumnCount;
HighKeyCount = ceil( KeybindCount / ColumnCount );
var lowKeyCount = floor( KeybindCount / ColumnCount );
for( var i = 0; i < highColumnCount; i++ ) {
    ColumnKeyCount[i] = HighKeyCount;
}
for( var i = 0; i < lowColumnCount; i++ ) {
    ColumnKeyCount[highColumnCount + i] = lowKeyCount;
}

ActiveColumnPos = 0;
ActiveOptionPos = 0;
IsKeyScanActive = false;
IsEnabled = false;

TickImageIndex = 0;
TickImageSpeed = 2 / 45;

MenuNextHoldStep = 0;
MenuPrevHoldStep = 0;
MenuIncHoldStep = 0;
MenuDecHoldStep = 0;

