/// @description  Death check

if( global.God ) {
    exit;
}

var playerId = id;
var killer = other.id;
// Check direct killer commands.
with( oKillerInstanceActivationCommand ) {
    if( KillerId == killer ) {
        if( IsActive ) {
            with( playerId ) {
                player_kill();
            }
        }
        exit;
    }   
}
// Check object killer commands.
var objectId = killer.object_index;
do {
    with( oKillerObjectActivationCommand ) {
        if( KillerId == objectId ) {
            if( IsActive ) {
                with( playerId ) {
                    player_kill();
                }
            }
            exit;
        }
    }
    objectId = object_get_parent( objectId );
} until( objectId == -100 );

// No relevant killer commands found, kill the player by default.
player_kill();

