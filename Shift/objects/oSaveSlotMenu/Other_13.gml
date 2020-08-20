/// @description  Decrease slot index
if( OverwriteModePos == -1 ) {
    ActiveSlotIndex--;
    if( ActiveSlotIndex < 1 ) {
        ActiveSlotIndex = 3;
    }
} else {
    OverwriteModePos = max( 0, OverwriteModePos - 1 );
}

