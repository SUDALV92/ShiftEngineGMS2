/// @description  room_set_infinite_jump( isSet )
/// @param  isSet 
function room_set_infinite_jump(argument0) {
	// Toggles the unlimited ability to air jump in the current room.
	// The effect lasts until game restart or room end.

	var isSet = argument0;

	with( oInfiniteJump ) {
	    instance_destroy();
	}
	if( isSet ) {
	    instance_create_depth( 0, 0, 0, oInfiniteJump );
	}



}
