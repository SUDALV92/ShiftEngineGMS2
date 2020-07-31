/// @description  Go to room
if( room_exists( RoomTo ) ) {
    if( Autosave ) {
        global.Autosave = true;
    }
    room_goto( RoomTo );
} else {
    show_debug_message( "Room in roomSwitch does not exist: " + string( RoomTo ) );
    instance_destroy();
}


