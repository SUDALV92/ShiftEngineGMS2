/// @description  Create Player

var shouldLoadFromHere;
if( instance_exists( oPlayerEntranceData ) ) {
    // Check entrance data to see if we load from this spot.
    shouldLoadFromHere = oPlayerEntranceData.EntranceId == EntranceId;
} else {
    // No entrance data, use the default loading spot.
    shouldLoadFromHere = ( EntranceId == 0 );
}

if( shouldLoadFromHere && !instance_exists( oPlayer ) ) {
    var player = instance_create_depth( x + 26 * sign( image_xscale ), y + 35, 0, oPlayer );
    // Invert horizontally in editor to spawn facing left.
    if( image_xscale < 0 ) {
        player.Dir = -1;
    }
    // Autosaving.
    if( global.Autosave ) {
        save_game();
        global.Autosave = false;
    }
    with( oPlayerEntranceData ) { instance_destroy(); }
    with( oPlayerEntrance ) { instance_destroy(); }   
} else {
    instance_destroy();
}



