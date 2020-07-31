/// @description  player_kill()
// Kills the calling player.

oWorld.DeathCount++;
update_title();
if( !get_game_value( "engine.freshSave" ) ) {
    save_stats();
}
if( global.CurrentBGM != noone ) {
    audio_pause_sound( global.InstanceBGM );
}
play_sound( seDeath );
var emitter = instance_create_depth( x, y, 0, oPlayerBloodEmitter );
emitter.GravityDir = GravityDir;
instance_destroy();


