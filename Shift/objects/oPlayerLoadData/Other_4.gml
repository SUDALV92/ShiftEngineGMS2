var player = instance_create_depth( x, y, depth, oPlayer );
player.Dir = Dir;
player.MaxAirJumpCount = MaxAirJumpCount;
player.CurrentAirJumpCount = CurrentAirJumpCount;
if( player.GravityDir != GravityDir ) {
    player_flip();
}
if( Autosave ) {
    game_save_player();
}
instance_destroy();

