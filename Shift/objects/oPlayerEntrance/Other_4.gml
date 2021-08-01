/// @description  Create Player

if( instance_exists( oPlayerLoadData ) ) {
    instance_destroy();
    exit;
}

if( instance_exists( oPlayer ) )
{
	instance_destroy();
	exit;
}

var playerOffsetX = 27;
var playerOffsetY = 36;
if( !instance_exists( oPlayerEntranceData ) ) {
    if( EntranceId == 0 ) {
        // Default load.
        var loadDir = sign( image_xscale );
        var player = instance_create_depth( x + playerOffsetX * loadDir, y + playerOffsetY, depth, oPlayer );
        player.Dir = loadDir;
        with( oPlayerEntrance ) {
            if( id != other.id ) {
                instance_destroy();
            }
        }       
    }
} else if( oPlayerEntranceData.EntranceId == EntranceId ) {
    // Entrance load.
    var loadDir = oPlayerEntranceData.Dir;
    var gravDir = oPlayerEntranceData.GravityDir;
    var player = instance_create_depth( x + playerOffsetX * loadDir, y + playerOffsetY, depth, oPlayer );
    if( gravDir != 0 ) {
        player.GravityDir = gravDir;
    }
    player.MaxAirJumpCount = oPlayerEntranceData.MaxAirJumpCount;
    player.CurrentAirJumpCount = oPlayerEntranceData.CurrentAirJumpCount;
    if( oPlayerEntranceData.Autosave ) {
        game_save_player();
    }
    with( oPlayerEntranceData ) {
        instance_destroy();
    }
    with( oPlayerEntrance ) {
        if( id != other.id ) {
            instance_destroy();
        }
    }
}
instance_destroy();


