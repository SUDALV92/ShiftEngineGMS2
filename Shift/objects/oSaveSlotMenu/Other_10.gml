/// @description  Load or start a new game
if( OverwriteModePos == -1 ) {
    var saveData = SaveData[ActiveSlotIndex];
    var isFreshSave = saveData[?"engine.freshSave"];
    if( ForceStartNewGame && !isFreshSave ) {
        OverwriteModePos = 1;
        OptionDisabled[1] = true;
    } else {
        initialize_game( ActiveSlotIndex );
    }
} else if( OverwriteModePos == 1 ) {
    OverwriteModePos = -1;
    OptionDisabled[1] = false;
} else {
    delete_save_data( ActiveSlotIndex );
    initialize_game( ActiveSlotIndex );
}

