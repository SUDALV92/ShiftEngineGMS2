// Toggles the unlimited ability to air jump in the current room.
// The effect lasts until game restart or room end.
function room_set_infinite_jump( isSet )
{
	with( oInfiniteJump ) 
	{
	    instance_destroy();
	}
	if( isSet ) {
	    instance_create_depth( 0, 0, 0, oInfiniteJump );
	}
}