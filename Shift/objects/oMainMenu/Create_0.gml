RectWidth = 250;
RectHeight = 280;

RectColor = make_color_rgb( 70, 70, 70 );
BorderColor = make_color_rgb( 30, 30, 30 );
OptionColor = c_white;
DisabledOptionColor = c_gray;
ActiveOptionColor = c_yellow;

MenuOptions[0] = "Continue";
MenuOptions[1] = "New Game";
MenuOptions[2] = "Settings";
MenuOptions[3] = "Quit"

OptionValues[0] = "";
OptionValues[1] = "";
OptionValues[2] = "";
OptionValues[3] = "";

OptionDisabled[0] = false;
OptionDisabled[1] = false;
OptionDisabled[2] = false;
OptionDisabled[3] = false;

// Events triggered on pressing confirm.
ConfirmEventIds[0] = 0;
ConfirmEventIds[1] = 1;
ConfirmEventIds[2] = 2;
ConfirmEventIds[3] = 3;

// Events triggered on pressing increase.
IncreaseEventIds[0] = -1;
IncreaseEventIds[1] = -1;
IncreaseEventIds[2] = -1;
IncreaseEventIds[3] = -1;

// Events triggered on pressing decrease.
DecreaseEventIds[0] = -1;
DecreaseEventIds[1] = -1;
DecreaseEventIds[2] = -1;
DecreaseEventIds[3] = -1;

BackEventId = 4;

IsEnabled = false;

event_inherited();



