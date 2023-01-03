// Kills the calling player.
function player_kill()
{
	if( global.God ) {
	    return false;
	}
	oWorld.DeathCount++;
	update_title();
	if( !game_get_value( "engine.freshSave" ) ) {
	    game_save_stats();
	}
	if( global.CurrentBGM != noone ) {
	    audio_pause_sound( global.InstanceBGM );
	}
	play_sound( seDeath );
	with( oPlayer ) {
	    var emitter = instance_create_depth( x, y, depth, oPlayerBloodEmitter );
	    emitter.GravityDir = GravityDir;
	    instance_destroy();
	}
	return true;
}