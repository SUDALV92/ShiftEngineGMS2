// Entrance identifier signifies an entrance object to use for player creation.
// If the identifier is -1, player loading data is stored in this object.
if( EntranceId == -1 ) {
    var player = instance_create_depth( x, y, 0, oPlayer );
    player.Dir = Dir;
    player.AirJumpCount = MaxAirJumpCount;
    player.CurrentAirJumpCount = CurrentAirJumpCount;
    if( player.GravityDir != GravityDir ) {
        player_flip();
    }
  
    // Autosaving.
    if( global.Autosave ) {
        save_game();
        global.Autosave = false;
    }
    instance_destroy();
}

