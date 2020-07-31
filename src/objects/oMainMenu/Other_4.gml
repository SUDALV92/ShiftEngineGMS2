// Check if continue game options needs to be disabled.
var slot1Data = oSaveSlotMenu.SaveData[1];
var slot2Data = oSaveSlotMenu.SaveData[2];
var slot3Data = oSaveSlotMenu.SaveData[3];
if( slot1Data[?"engine.freshSave"] && slot2Data[?"engine.freshSave"] && slot3Data[?"engine.freshSave"] ) {
    OptionDisabled[0] = true;
    ActiveOptionPos = 1;
}

