RectWidth = 420;
RectHeight = 350;

RectColor = make_color_rgb( 70, 70, 70 );
BorderColor = make_color_rgb( 30, 30, 30 );
OptionColor = c_white;
DisabledOptionColor = c_gray;
ActiveOptionColor = c_yellow;

MenuOptions[0] = "Master Volume:";
MenuOptions[1] = "Music Volume:";
MenuOptions[2] = "Mute Music:";
MenuOptions[3] = "Smoothing:";
MenuOptions[4] = "Keyboard Controls"
MenuOptions[5] = "Back"

ValueOptionLineWidth = 330;
event_user( 15 );
OptionValues[4] = "";
OptionValues[5] = "";

OptionDisabled[0] = false;
OptionDisabled[1] = false;
OptionDisabled[2] = false;
OptionDisabled[3] = false;
OptionDisabled[4] = false;
OptionDisabled[5] = false;

// Events triggered on pressing confirm.
ConfirmEventIds[0] = -1;
ConfirmEventIds[1] = -1;
ConfirmEventIds[2] = 4;
ConfirmEventIds[3] = 7;
ConfirmEventIds[4] = 5;
ConfirmEventIds[5] = 6;

// Events triggered on pressing increase.
IncreaseEventIds[0] = 0;
IncreaseEventIds[1] = 2;
IncreaseEventIds[2] = 4;
IncreaseEventIds[3] = 7;
IncreaseEventIds[4] = -1;
IncreaseEventIds[5] = -1;

// Events triggered on pressing decrease.
DecreaseEventIds[0] = 1;
DecreaseEventIds[1] = 3;
DecreaseEventIds[2] = 4;
DecreaseEventIds[3] = 7;
DecreaseEventIds[4] = -1;
IncreaseEventIds[5] = -1;

BackEventId = 6;

IsEnabled = false;

event_inherited();



