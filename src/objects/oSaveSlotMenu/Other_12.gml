/// @description  Increase slot index
if( OverwriteModePos == -1 ) {
    ActiveSlotIndex++;
    if( ActiveSlotIndex > 3 ) {
        ActiveSlotIndex = 1;
    }
} else {
    OverwriteModePos = min( 1, OverwriteModePos + 1 );
}

