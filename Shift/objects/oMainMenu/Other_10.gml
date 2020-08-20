/// @description  Continue game

var slot1Data = oSaveSlotMenu.SaveData[1];
var slot2Data = oSaveSlotMenu.SaveData[2];
var slot3Data = oSaveSlotMenu.SaveData[3];
var isSlot1Fresh = slot1Data[?"engine.freshSave"];
var isSlot2Fresh = slot2Data[?"engine.freshSave"];
var isSlot3Fresh = slot3Data[?"engine.freshSave"];

// Automatically continue games if a single slot exists.
if( !isSlot1Fresh && isSlot2Fresh && isSlot3Fresh ) {
    initialize_game( 1 );
} else if( isSlot1Fresh && !isSlot2Fresh && isSlot3Fresh ) {
    initialize_game( 2 );
} else if( isSlot1Fresh && isSlot2Fresh && !isSlot3Fresh ) {
    initialize_game( 3 );
} else {
    // Show slot selection.
    IsEnabled = false;
    oSaveSlotMenu.ActiveOptionPos = 0;
    oSaveSlotMenu.alarm[0] = 1;
    oSaveSlotMenu.ForceStartNewGame = false;
    instance_move_to( oSaveSlotMenu, xstart, ystart, 30 );
    instance_move_to( id, oSettingsMenu.xstart, oSettingsMenu.ystart, 30 );
}

