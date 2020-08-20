/// @description  Go to room
if( room_exists( RoomTo ) ) {
    var entranceData = instance_create_depth( 0, 0, 0, oPlayerEntranceData );
    entranceData.Autosave = Autosave;
    entranceData.EntranceId = EntranceTo;
    entranceData.Dir = other.Dir;
    entranceData.MaxAirJumpCount = other.MaxAirJumpCount;
    if( PreserveAirJumps ) {
        entranceData.CurrentAirJumpCount = other.CurrentAirJumpCount;
    } else {
        entranceData.CurrentAirJumpCount = other.MaxAirJumpCount;
    }
    if( PreserveGravity ) {
        entranceData.GravityDir = other.GravityDir;
    } else {
        entranceData.GravityDir = 0;
    }
    room_goto( RoomTo );
} else {
    show_debug_message( "Room in roomSwitch does not exist: " + string( RoomTo ) );
    instance_destroy();
}


