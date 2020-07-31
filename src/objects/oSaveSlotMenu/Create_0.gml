RectWidth = 200;
RectHeight = 400;

RectColor = noone;
BorderColor = noone;
OptionColor = c_white;
DisabledOptionColor = OptionColor;
ActiveOptionColor = c_yellow;

MenuBgColor = make_color_rgb( 70, 70, 70 );
SlotBgColor = make_color_rgb( 30, 30, 30 );
MenuBorderColor = make_color_rgb( 0, 0, 0 );

MenuOptions[0] = "";
MenuOptions[1] = "Back";

OptionValues[0] = "";
OptionValues[1] = "";

OptionDisabled[0] = false;
OptionDisabled[1] = false;

// Events triggered on pressing confirm.
ConfirmEventIds[0] = 0;
ConfirmEventIds[1] = 1;

// Events triggered on pressing increase.
IncreaseEventIds[0] = 2;
IncreaseEventIds[1] = -1;

// Events triggered on pressing decrease.
DecreaseEventIds[0] = 3;
DecreaseEventIds[1] = -1;

BackEventId = 1;

IsEnabled = false;

event_inherited();

/////////////////////////////////////////////
// Save slot data.

ForceStartNewGame = false;
OverwriteModePos = -1;
ActiveSlotIndex = clamp( global.LastSaveIndex, 1, 3 );
SaveData[1] = get_save_data( 1 );
SaveData[2] = get_save_data( 2 );
SaveData[3] = get_save_data( 3 );

SlotTextColor = c_white;
ActiveSlotColor = ActiveOptionColor;

